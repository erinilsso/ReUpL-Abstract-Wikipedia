import json

def code_to_label(code, lang):
        file_path = "../data/occupations/occupations_" + lang + ".csv" #sv, en, de

        file = open(file_path) #target language
        rows = file.readlines()

        if code is None:
                return

        for row in rows: 
                if code in row:
                        #print("here",row.split(",")[3],code)
                        return row.split(",")[3]
                        break 
        
        file.close()
        
        
def get_occupation_code(label):
        file = open("../data/occupations/occupations_en.csv", 'r+')
        rows = file.readlines()
        
        flag = False
        found_in_big_row = False

        for i ,row in enumerate(rows):
                if label == row.replace("\n",""):
                        #print(row)
                        index = i
                        flag = True
                        break

                if ","+label in row and "Occupation," in row:
                           
                        found_in_big_row = True
                        index = i
                        flag = True
                        break
        
        if not flag:
                #print("No matching label found.")
                return 

        while True and not found_in_big_row:
                index -= 1
                if "Occupation," in rows[index]:
                        work_code = rows[index].split(",")[1]
                        #print(index, work_code)
                        return work_code
        
        if found_in_big_row:
                work_code = rows[index].split(",")[1]
                return work_code
        
        

        file.close()


#print(code_to_label(get_occupation_code(" disc jockey"),"sv"))


file = open("../data/famousPeopleEn.json", 'r+')
rows = json.load(file)

for row in rows:
        name = row["personLabelSv"]
        occupations_en = row["occupationLabelsEn"]

        occupations_en = occupations_en.split(',')
        occupations_en = [s.strip() for s in occupations_en]

        occupations_sv = []
        for occ in occupations_en:
                occupations_sv.append(code_to_label(get_occupation_code(occ),"sv"))

        #occ_sv = code_to_label(get_occupation_code(occ_en),"sv")

        print(name)
        print("en:", occupations_en)
        print("sv:",occupations_sv)
        print("-----")
        