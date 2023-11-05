import pgf
from collections import namedtuple

def massage_tree(tree, lang):
    try:
        res = tree.unpack()
    except TypeError:
        return tree
    
    if type(res) == str:
        return tree
    elif type(res) == int:
        return tree
    fun, args = res

    lang_name = lang.name
    
    if fun == "unitHectare":
        val = args[0].unpack()
        if lang_name == "BoroughsSwe":
            return pgf.Expr("unitHectare", args)
            #return pgf.Expr("unitHectare", [pgf.Expr(val*1)])
        elif lang_name == "BoroughsEng":
            return pgf.Expr("unitSquareM", [pgf.Expr(str(hectare2miles(val)))])
        elif lang_name == "BoroughsGer":
            return pgf.Expr("unitSquarekm", [pgf.Expr(str(hectare2km(val)))])
    elif fun == "relativeToCityFact":
        dist = args[0].unpack()
        if lang_name == "BoroughsEng":
            return pgf.Expr("relativeToCityFact", [pgf.Expr(km_to_miles(dist)), args[1], args[2]])
        else:
            return pgf.Expr("relativeToCityFact", [pgf.Expr(round_km(dist)), args[1], args[2]])
            
    args = [massage_tree(t, lang) for t in args]
    return pgf.Expr(fun,args)

def round_km(km):
    km = float(km.split(" ")[0])
    km = round(km)
    return str(km) + " km"

def km_to_miles(km):
    km = float(km.split(" ")[0])
    km = round(km*0.621371192)
    km = str(km) + " miles"
    return km

def hectare2miles(h):
   return round(h*0.003861022, 2)

def hectare2km(h):
    return round(h*0.01, 2)


class FactSystem:
    def __init__(self,fnames,gr,lang1):
        self.fieldnames = fnames 
        self.grammar = gr
        self.language1 = lang1   # the language in which entities are parsed to trees

    def get_data(self,filename):
        data = []
        Data = namedtuple('Data', self.fieldnames)
        file = open(filename)
        for line in file:
            fields = Data(*line.split('\t'))
            data.append(fields)
        return data

    # can raise ParseError
    def str2exp(self,cat,s):
        eng = self.grammar.languages[self.language1]
        pp = eng.parse(s,cat=pgf.readType(cat))
        _,e = pp.__next__()
        return e

    def exp2str(self,exp):
        eng = self.grammar.languages[self.language1]
        return eng.linearize(exp)

    def data2lin(self,cat,s):
        return self.exp2str(self.str2exp(cat,s))
        
    def run(self,datafile,fact_generator):
        gr = self.grammar
        data = sorted(list(self.get_data(datafile)))
        langs = list(gr.languages.values())

        output = ""
        for lang in langs:
            text = []
            for (tree, _) in fact_generator(self,data,lang):
                tree = massage_tree(tree, lang)
                lin = lang.linearize(tree)
                if lin: text.append(lin[0].upper() + lin[1:])
            output = output + "\n" + '\n'.join(text)
        return output
    
    def run_one(self,datafile,fact_generator,row):
        gr = self.grammar
        data = list(self.get_data(datafile))[row]
        langs = list(gr.languages.values())

        output = []
        metadata = {}
        for lang in langs:
            text = []
            for (tree, meta) in fact_generator(self,[data],lang):
                metadata = meta
                tree = massage_tree(tree, lang)
                lin = lang.linearize(tree)
                if lin: text.append(lin[0].upper() + lin[1:])
            output.append('\n'.join(text))
        return (output, metadata)

def simple_facts(factsys,data):
    "for each tuple in data, generate an attribute fact for each field"
    fields = factsys.fieldnames.split()    
    facts = []
    for tuple in data:
        object = factsys.str2exp("Object",tuple[0])
        for (attr,val) in [(fields[i],tuple[i]) for i in range(1,len(fields))]:
            fact = pgf.Expr("AttributeFact", [
                    factsys.str2exp("Attribute",attr),
                    object,
                    factsys.str2exp("Value",val)])
            facts.append(fact)
    return facts


def example_run():
    gr = pgf.readPGF('Countries.pgf')
    factsys = FactSystem(
        'country capital area population continent currency',
        gr,
        'CountriesEng'
        )
            
    print(factsys.run('../data/countries.tsv',simple_facts))

if __name__ == "__main__":
    example_run()
