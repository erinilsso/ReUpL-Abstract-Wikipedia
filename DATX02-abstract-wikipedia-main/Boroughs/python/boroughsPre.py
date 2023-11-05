import sys
import os
from dotenv import load_dotenv
import pandas as pd

load_dotenv()

gf_path = os.getenv("AW_GF")
python_path = os.getenv("AW_PYTHON")
query_data_path = os.getenv("AW_QUERY_DATA")
data_path = os.getenv("AW_DATA")

def merge_query_person():
    data1 = pd.read_csv(query_data_path + 'query_persons_dees.tsv', sep='\t', header=0)
    data2 = pd.read_csv(query_data_path + 'query_persons.tsv', sep='\t', header=0)
    mergeddata = pd.merge(data2, data1, on=['person', 'personLabelSv', 'cityOfBirth', 'sitelinks'])


    mergeddata.to_csv(query_data_path + 'query_persons_merged.tsv', sep="\t", index=False)

def save_bnames_swe(data_file):
    bnames = []
    file = open(data_file)
    rows = file.readlines()
    file.close()
    for row in rows:
        name = row.split("\t")[1]
        bnames.append(name)
    
    # Store in new file
    f = open(data_path + "boroughs.txt", "w")
    f.write("\n".join(bnames))
    f.close()

def make_BNames_concrete(file_path_GF, file_path_query, lang_index):
    file_GF = open(file_path_GF, 'r+')
    file_query = open(file_path_query, 'r+')
    rows_GF = file_GF.readlines()
    rows_query = file_query.readlines()
    q_names = [ r.split("\t")[0] for r in rows_query ]
    lang_names = [ r.split("\t")[lang_index] for r in rows_query] #1 is the index of the language we want to make bname for
    #borough_names_lines_concrete = [ f"lin {clean(r)}_BName = mkBName \"{n}\" ; \n" for r in list(set(query_names)) for n in list(set(lang_names))]
    #figure this one out

    #for i in range(len(llistahär)):

    borough_names_lines_concrete = []
    for index in range(len(lang_names)):
       borough_names_lines_concrete.append( f"lin {clean(q_names[index])}_BName = mkBName \"{lang_names[index]}\" ; \n" )     

    
    index_start = rows_GF.index("-- #INSERT HERE# --\n")
    index_end = rows_GF.index("-- #END INSERT# --\n")
    head = rows_GF[:index_start+1]
    tail = rows_GF[index_end:]
    
    list_of_boroughs = head + borough_names_lines_concrete + tail 

    file_GF.seek(0)
    file_GF.writelines(list_of_boroughs)
    file_GF.truncate()

    file_GF.close()
    file_query.close()

def make_BNames_abstract(file_path_GF, file_path_query):
    file_GF = open(file_path_GF, 'r+')
    file_query = open(file_path_query, 'r+')
    rows_GF = file_GF.readlines()
    rows_query = file_query.readlines()
    query_names = [ r.split("\t")[0] for r in rows_query ]

    borough_names_lines_abstract = [ f"fun {clean(r)}_BName : BName ; \n" for r in list(set(query_names))]
    
    index_start = rows_GF.index("-- #INSERT HERE# --\n")
    index_end = rows_GF.index("-- #END INSERT# --\n")
    head = rows_GF[:index_start+1]
    tail = rows_GF[index_end:]
    
    list_of_boroughs = head + borough_names_lines_abstract + tail 

    file_GF.seek(0)
    file_GF.writelines(list_of_boroughs)
    file_GF.truncate()

    file_GF.close()
    file_query.close()

def make_MNames_concrete(file_path_GF, file_path_query, muni_trans):
    file_GF = open(file_path_GF, 'r+')
    file_query = open(file_path_query, 'r+')
    rows_GF = file_GF.readlines()
    #print("bug here")
    rows_query = file_query.readlines()

    kv = {}

    for row in rows_query:
        urls = row.split("\t")[7].split(",")
        muni_names = row.split("\t")[8].split(",")
        if(len(urls) != len(muni_names)): #Ignorerar 
            continue
        for index, url in enumerate(urls):

            q_value = url.split("/")[-1]
            muni_name = muni_names[index]
            if("kommun" in muni_name):
                kv[q_value] = clean_muni_name(muni_name)

    
    muni_names_lines_concrete = []
    for (k,v) in kv.items():
        muni_name = v.replace("kommun", muni_trans)
        muni_names_lines_concrete.append( f"lin {clean(k)}_MName = mkMName \"{muni_name}\" ; \n" )         

    
    index_start = rows_GF.index("-- #INSERT HERE# --\n")
    index_end = rows_GF.index("-- #END INSERT# --\n")
    head = rows_GF[:index_start+1]
    tail = rows_GF[index_end:]
    
    list_of_munis = head + muni_names_lines_concrete + tail 

    file_GF.seek(0)
    file_GF.writelines(list_of_munis)
    file_GF.truncate()


    file_GF.close()
    file_query.close()

def make_MNames_abstract(file_path_GF, file_path_query):
    file_GF = open(file_path_GF, 'r+')
    file_query = open(file_path_query, 'r+')
    rows_GF = file_GF.readlines()
    rows_query = file_query.readlines()

    kv = {}
    
    for row in rows_query:
        urls = row.split("\t")[7].split(",")
        muni_names = row.split("\t")[8].split(",")
        if(len(urls) != len(muni_names)): #Ignoring special cases where municipalities have been dissolved
            continue
        for index, url in enumerate(urls):
            q_value = url.split("/")[-1]
            muni_name = muni_names[index]
            if("kommun" in muni_name):
                kv[q_value] = clean_muni_name(muni_name)

    # rows_query = [r for r in file_query.readlines() if "kommun" in r.split("\t")[8]] 
    # kv = { r.split("\t")[0]:r.split("\t")[-1] for r in rows_query}

    muni_names_lines_abstract = [ f"fun {clean(r)}_MName : MName ; \n" for r in kv.keys()] 

    #print(rows_GF)
    #return
    
    index_start = rows_GF.index("-- #INSERT HERE# --\n")
    index_end = rows_GF.index("-- #END INSERT# --\n")
    head = rows_GF[:index_start+1]
    tail = rows_GF[index_end:]
    
    list_of_munis = head + muni_names_lines_abstract + tail 

    file_GF.seek(0)
    file_GF.writelines(list_of_munis)
    file_GF.truncate()

    file_GF.close()
    file_query.close()



def clean(s):
    return s.replace(' ', '_').replace('-', '_').replace('(','').replace(')','').replace(',','').replace('\n', '')

def clean_muni_name(s):
    return s.strip().replace('\n','')

def make_onames_abstract(file_path_GF, file_path_query):
    file_GF = open(file_path_GF, 'r+')
    file_query = open(file_path_query, 'r+')
    rows_GF = file_GF.readlines()
    rows_query = file_query.readlines()

    occupation_set = set()
    
    for row in rows_query:
        occupations = row.split("\t")[2].split(",") #Index of English Occupations
        for index, occupation in enumerate(occupations):
            occupation_set.add(f"fun {clean(occupation.strip())}_OName : OName; \n")


    index_start = rows_GF.index('-- #INSERT HERE# --\n')
    index_end = rows_GF.index("-- #END INSERT# --\n")
    head = rows_GF[:index_start+1]
    tail = rows_GF[index_end:]
    
    list_of_munis = head + list(occupation_set) + tail 

    file_GF.seek(0)
    file_GF.writelines(list_of_munis)
    file_GF.truncate()

    file_GF.close()
    file_query.close()


def make_onames_concrete(file_path_GF, file_path_query, lang_index):
    file_GF = open(file_path_GF, 'r+')
    file_query = open(file_path_query, 'r+')
    rows_GF = file_GF.readlines()
    rows_query = file_query.readlines()

    occupation_set = set()
    
    for row in rows_query:
        occupations = row.split("\t")[lang_index].split(",") #Index of English Occupations
        oNames = row.split("\t")[2].split(",")
        for index, occupation in enumerate(occupations):
            try:
                occupation_set.add(f"lin {clean(oNames[index].strip())}_OName = mkOName \"{occupation.strip()}\"; \n")
            except Exception :
                continue

    index_start = rows_GF.index('-- #INSERT HERE# --\n')
    index_end = rows_GF.index("-- #END INSERT# --\n")
    head = rows_GF[:index_start+1]
    tail = rows_GF[index_end:]
    
    list_of_munis = head + list(occupation_set) + tail 

    file_GF.seek(0)
    file_GF.writelines(list_of_munis)
    file_GF.truncate()

    file_GF.close()
    file_query.close()




save_bnames_swe(query_data_path + "boroughs.tsv")

make_BNames_abstract(gf_path + "BoroughNames.gf", query_data_path + "boroughs.tsv")
make_BNames_concrete(gf_path + "BoroughNamesSwe.gf", query_data_path + "boroughs.tsv",1) #Swe
make_BNames_concrete(gf_path + "BoroughNamesEng.gf", query_data_path + "boroughs.tsv",2) #Eng   
make_BNames_concrete(gf_path + "BoroughNamesGer.gf", query_data_path + "boroughs.tsv",3) #De


#are left as 8 while we are only importing swedish municipality names
make_MNames_abstract(gf_path + "MuniNames.gf", query_data_path + "boroughs.tsv")
make_MNames_concrete(gf_path + "MuniNamesSwe.gf", query_data_path + "boroughs.tsv", "kommun") #Swe
make_MNames_concrete(gf_path + "MuniNamesEng.gf", query_data_path + "boroughs.tsv", "municipality") #Eng
make_MNames_concrete(gf_path + "MuniNamesGer.gf", query_data_path + "boroughs.tsv", "Gemeinde") #Ger

make_onames_abstract(gf_path + "OccupationNames.gf",query_data_path +  "occupations.tsv")
make_onames_concrete(gf_path + "OccupationNamesEng.gf", query_data_path + "occupations.tsv", 2)
make_onames_concrete(gf_path + "OccupationNamesSwe.gf", query_data_path + "occupations.tsv", 1)
make_onames_concrete(gf_path + "OccupationNamesGer.gf", query_data_path + "occupations.tsv", 3)




merge_query_person()

# def main():

#     # python boroughspre1337 concrete en ../flskjdlfk
#     type = sys.argv[1]
#     lang = sys.argv[2]
#     file = sys.argv[3]

#     if(type == "abstract"):
#         pass
#     if(type == "concrete"):
#         pass

#     make_BNames_abstract("BoroughNames.gf", "query.tsv")
#     make_BNames_concrete("BoroughNamesSwe.gf", "query.tsv")

# if(__name__ == "__main__"):
#     main()