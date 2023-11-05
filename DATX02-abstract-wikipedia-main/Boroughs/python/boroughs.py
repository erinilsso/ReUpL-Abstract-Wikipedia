from collections import namedtuple
import pgf
import csv
from data_facts import *

def get_boroughs(filename) :
    boroughs = []
    Borough = namedtuple('Borough', 'city cityLabelSv cityLabelEn cityLabelDe population area coordinates municipalityLabelSv')
    file = open(filename)
    for line in file: 
        fields = Borough(*line.split('\t'))
        boroughs.append(fields)
    file.close()
    return boroughs


def borough_facts(b):
    # object = pgf.Expr('NameObject', [pgf.Expr('StringName', [string_expr(b.cityLabel)])])
    object = pgf.Expr('NameObject', [pgf.Expr('bName', [pgf.Expr(clean(b.city) + '_BName', [])])])
    return [
        pgf.Expr('AttributeFact',
                 [pgf.Expr(attr,[]), object, pgf.Expr('NumericValue', [pgf.Expr('IntNumeric', [pgf.readExpr(val)])])])
            for( attr, val) in [
                ('population_Attribute', b.population),
                ('area_Attribute', b.area),
                ('municipality_Attribute', b.municipalityLabelSv)
                
                
            ]
        # pgf.Expr('AttributeFact',
        #          [pgf.Expr(attr,[]), object, pgf.Expr('NameValue', [pgf.Expr('StringName', [string_expr(val)])])])
        #     for( attr, val) in [
        #         ('population_Attribute', b.population),
        #         ('area_Attribute', b.area)
        #     ]
    ]
    

def string_expr(s):
    return pgf.readExpr(str('"' + s + '"'))

def clean(s):
    return s.replace(' ', '_').replace('-', '_').replace('(','').replace(')','').replace(',','')


def main():
    gr = pgf.readPGF('../gf/Boroughs.pgf')
    boroughs = get_boroughs("../data/output.tsv")
    langs = list(gr.languages.values())
    print(langs)
    for lang in langs:
        text = []
        for b in boroughs:
            for t in borough_facts(b):
                #print(t)
                gr.checkExpr(t, pgf.readType("AttributeFact"))
                text.append(lang.linearize(t))
                #print(len(lang.linearize(t)))
        print('\n'.join(text))

if(__name__ == "__main__"):
    main()