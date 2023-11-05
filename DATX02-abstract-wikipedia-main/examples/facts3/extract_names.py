country_file = 'countries.tsv'
name_cat = 'CName'
included_fields = [0,1,4,5]

def get_names(filename):
    names = set()
    file = open(filename)
    for line in file.readlines():
        fields = line.split('\t')
#        print("FIELDS",fields)
        for i in included_fields:
            names.add(fields[i].strip())
    return names
     
def name_rules(name,cat):
    fun = mkFun(name,cat)
    return (
      ' '.join(["fun",fun,':',cat,';']),
      ' '.join(["lin",fun,'=','mk'+cat, '"'+name+'"', ';'])
      )

def escape(s):
    r = ''
    for c in s:
        if c in "\\'":
            r = r + "\\" + c
        else:
            r = r + c
    return r

def mkFun(name,cat):
    parts = name.split()
    parts.append(cat)
    fun = '_'.join(parts)

    esc = False
    if not name or not (name[0].isalpha()):
        esc = True
    else:
        for c in name:
            if not (c.isalpha() or c.isdigit() or c in "' _"):
                esc = True
                break
    if esc:
        fun = "'" + escape(fun) + "'"
    return fun


def main():
  names = get_names(country_file)
  for name in names:
#      print("NAME",name)
      fun,lin = name_rules(name,name_cat)
      print(fun)
      print(lin)
    
if __name__ == "__main__":
    main()

