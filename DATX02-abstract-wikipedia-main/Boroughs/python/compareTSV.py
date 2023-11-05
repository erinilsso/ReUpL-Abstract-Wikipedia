file_swe_eng_ger = open("./query_data/occupations.tsv", 'r+')
file_swe_eng = open("./query_data/occupationsSweEng.tsv", 'r+')

rows1 = file_swe_eng_ger.readlines()
rows2 = file_swe_eng.readlines()

# rows1 = [row.split("\t")[0] for row in rows1]
# rows2 = [row.split("\t")[0] for row in rows2]

# for row in rows1:
#     if row not in rows2:
#         print(row)
    

set1 = set()
set2 = set()

for i, row1 in enumerate(rows1):
    for row2 in rows2:
        if row1.split("\t")[0] == row2.split("\t")[0]:
            set2.add(row2) 
for row in rows2 :
    set1.add(row)



res = open("./diff.txt", 'r+')
for i in list(set1-set2):
    res.write(i)
            


