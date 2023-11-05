from cgitb import html
from lib2to3.pgen2.parse import ParseError
import sys
from data_facts import *
from boroughs import *
import pgf
import geopy
from geopy import distance
from geopy.distance import lonlat
from geographiclib.geodesic import Geodesic
import os
from dotenv import load_dotenv
import post_processing as pp
import weather as W
import json

load_dotenv()

gf_path = os.getenv("AW_GF")
python_path = os.getenv("AW_PYTHON")
query_data_path = os.getenv("AW_QUERY_DATA")


labels = 'city cityLabelSv cityLabelEn cityLabelDe population area coordinates municipality municipalityLabelSv image'
lang = 'BoroughsSwe'

big_cities = {
    "Stockholm": (18.046331211, 59.310087557),  # Stockholm #Q94385
    "Malmö": (13.021423031, 55.593188589),   # Malmö Q2211
    "Göteborg": (11.980966694, 57.671706102),  # Göteborg Q25287
    "Umeå": (20.270566462, 63.828453583)  # Umeå Q25579
}


with open(query_data_path+"query_persons_merged.tsv") as file:
    rows = file.readlines()
    #{cityName : [(famous1,{sv: [work1, work2, ...]})]}
    #{cityName : [(famous1,[work1, work2]),(famous 2) ...]}]}

    famous_people_dict = {}
    for row in rows:
        if "personLabelSv" in row: #For the headers in tsv file
            continue
        values = row.split("\t")
        cityName = values[2].split("/")[-1]
        # print(famousPeopleDict)
        lang_occ_dict = {}
        for occ in values[3].split(","):
            if 'BoroughsSwe' in lang_occ_dict:
                lang_occ_dict['BoroughsSwe'].append(occ)
            else:
                lang_occ_dict['BoroughsSwe'] = [occ]
        for occ in values[4].split(","):
            if 'BoroughsEng' in lang_occ_dict:
                lang_occ_dict['BoroughsEng'].append(occ)
            else:
                lang_occ_dict['BoroughsEng'] = [occ]
        for occ in values[6].split(","):
            if 'BoroughsGer' in lang_occ_dict:
                lang_occ_dict['BoroughsGer'].append(occ)
            else:
                lang_occ_dict['BoroughsGer'] = [occ]
        person_and_occs = (values[1], lang_occ_dict)
        if cityName in famous_people_dict:
            famous_people_dict[cityName].append(person_and_occs)    
        else:
            famous_people_dict[cityName] = [person_and_occs]

def round_int(s, r):
    e = len(s) - r
    p = 10**e
    i = (int(s)//p) * p
    return pgf.readExpr(str(i))

def get_events(qid, lang):
    events = []
    with open(query_data_path + "event_translations.json") as file:
        data = json.load(file)
        try:
            events = data[qid][lang]
        except:
            pass
    #with open(query_data_path + "events.tsv") as file:
    #    rows = file.readlines()
    #    for row in rows:
    #        event = row.split("\t")
    #        if(event[0] == qid):
    #            events.append(event)
    return events

# explicit trees via embedded grammar module, takes 0.214s


def borough_texts_embedded(factsys, data, lang):
    factsys.grammar.embed("G")
    import G

    fields = factsys.fieldnames.split()

    facts = []

    def check_muni(m):
        try:
            muni = factsys.str2exp("Name", m)
        except pgf.ParseError:
            muni = False
        return muni
    

    for tuple in data:
        city        = factsys.str2exp("Name",tuple.cityLabelSv)
        population  = pgf.readExpr(str(tuple.population))
        area        = pgf.readExpr(str(tuple.area))
        image       = tuple.image        
        

        events = get_events(tuple.city, lang.name)


    def clean_occupation(s):
        return s.replace('-', ' ')

# OBS anropa inte om occupations längd är 1 eller mindre!
    def occ_to_occlist(occupations):
        
        for i in range(len(occupations)):
            if i == 0:
                occ1 = G.mkOccupation(pgf.Expr(clean_occupation(occupations[i])))
            if i == 1:
                occ2 = G.mkOccupation(pgf.Expr(clean_occupation(occupations[i])))
                occ_list = G.mkOccupationList(occ1, occ2)
            if i > 1: 
                occ = G.mkOccupation(pgf.Expr(clean_occupation(occupations[i])))
                occ_list = G.addOccupation(occ, occ_list)

        return occ_list

    person_occ_tuples = [] # (personName , (categorizer, pgf_object)),  categorizer tells if its an occ or an occlist
    for tuple in data:
        city = factsys.str2exp("Name", tuple.cityLabelSv)
        population = pgf.readExpr(str(tuple.population))
        area = pgf.readExpr(str(tuple.area))
        image = tuple.image


        if tuple.city in famous_people_dict.keys():
            famous_persons = famous_people_dict[tuple.city]
            
            for famous_person in famous_persons[0:3]:
                if len(famous_person[1][lang.name]) <= 1:
                    person = famous_person[0]
                    occ = G.mkOccupation(pgf.Expr(clean_occupation(famous_person[1][lang.name][0])))
                    person_occ_tuples.append((person, (0, occ))) 
                else:
                    occ_list = occ_to_occlist(famous_person[1][lang.name])
                    person = famous_person[0]
                    person_occ_tuples.append((person, (1, occ_list)))


        munis = tuple.municipalityLabelSv.split(",")

        parsed_munis = list(map(lambda x: check_muni(x), munis))
        parsed_munis = [m for m in parsed_munis if m]


        poparea_conj = G.ConjSentence(
                G.FactSentence(
                    G.AttributeFact(
                        G.population_Attribute, G.NameObject(city), G.NumericValue(G.IntNumeric(population))
                    )
                ),
                G.FactSentence(
                    G.AttributeFact(
                        #G.area_Attribute, G.PronObject(city), G.stringValue(G.unitHectareTest(area))
                        G.area_Attribute, G.PronObject(city), G.unitHectare(pgf.readExpr(str(area)))

                    )
                )
            )
        


        tmp_str = tuple.coordinates.split(" ")
        coord = (float(tmp_str[0][6:]), float(tmp_str[1][:-1]) )
        closest, dist = closest_big_city(coord)
        dir = bearing2dir(get_bearing(big_cities[closest], coord), G)


        doc = None
        doc = G.OneSentenceDoc( poparea_conj)

        current_temp = W.current_weather(coord[0],coord[1])

        location = get_location(tuple.coordinates)
        locDict = {"south": G.location_south,
                   "middle": G.location_central, "north": G.location_north}

        if len(parsed_munis) > 0:
            doc = G.AddSentenceDoc(doc, G.FactSentence(
                G.locationFact2(city, locDict[location], parsed_munis[0])
            ))

        if dist > 0.0:
            doc = G.AddSentenceDoc(doc, G.FactSentence(
                G.relativeToCityFact(pgf.Expr(str(dist) + " km"),
                                    dir, factsys.str2exp("Name", closest))
            ))

        if(current_temp[0]):
            doc = G.AddSentenceDoc(doc, G.FactSentence(
                G.weatherFact(pgf.Expr(str(current_temp[1])+ "°"), city)
            ))


        # doc = G.AddSentenceDoc(doc, G.FactSentence(
        #     G.testCnList(G.testCN,G.testCN,G.testCN)
        # ))

#FamousPeople:
        #print(locals())
        if 'person_occ_tuples' in locals():
            
            for person_occ_tuple in person_occ_tuples:
                person, temp = person_occ_tuple
                categorizer, occupation = temp
                if categorizer == 0:
                    doc = G.AddSentenceDoc(doc,G.FactSentence(
                        G.famousPersonFrom0(pgf.Expr(person), occupation, city)
                    ))
                if categorizer == 1: 
                    doc = G.AddSentenceDoc(doc,G.FactSentence(
                        G.famousPersonFrom1(pgf.Expr(person),occupation, city)
                    ))


        #doc = G.AddSentenceDoc(doc, G.NewLineSentence())        

        if len(events) > 1:    
            doc = G.AddSentenceDoc(doc, G.FactSentence(G.title2fact(G.titleEvents)))
            item1 = G.mkListItem(pgf.Expr(str(events[0])))
            item2 = G.mkListItem(pgf.Expr(str(events[1])))
            htmllist = G.mkHtmlList(item1, item2)

            if len(events) > 2:
                for e in events[2:]:
                    item3 = G.mkListItem(pgf.Expr(str(e)))
                    htmllist = G.addHtmlList(item3, htmllist)
            
            htmllist = G.wrapWithUl(htmllist)
            doc = G.AddSentenceDoc(doc, G.FactSentence(htmllist))
        elif len(events) == 1:
            doc = G.AddSentenceDoc(doc, G.FactSentence(G.title2fact(G.titleEvents)))
            item = G.mkListItem(pgf.Expr(str(events[0])))
            htmllist = G.singleItemHtmlList(item)
            doc = G.AddSentenceDoc(doc, G.FactSentence(htmllist))
        
        
        facts.append((doc, [image, tuple.coordinates]))

    return facts

# trees via parser, takes 0.537s


def borough_texts_parsed(factsys, data):
    factsys.grammar.embed("G")
    import G

    fields = factsys.fieldnames.split()

    facts = []

    for tuple in data:
        city = factsys.data2lin("BName", tuple.cityLabelSv + "s")
        population = factsys.data2lin('Numeric', tuple.population)
        area = factsys.data2lin('Numeric', tuple.area)

        doc = factsys.str2exp("Doc",
                              ("{} befolkning är {} och dess yta är {} . ").format(city, population, area))
        facts.append(doc)
    return facts


def bearing2dir(b, G):
    if b >= 337.5 or b < 22.5:
        return G.dirN
    elif b < 67.5:
        return G.dirNE
    elif b < 112.5:
        return G.dirE
    elif b < 157.5:
        return G.dirSE
    elif b < 202.5:
        return G.dirS
    elif b < 247.5:
        return G.dirSW
    elif b < 292.5:
        return G.dirW
    elif b < 337.5:
        return G.dirNW
    return None


def get_bearing(c1, c2):
    return (90 - Geodesic.WGS84.Inverse(c1[0], c1[1], c2[0], c2[1])['azi1'] + 360) % 360


def closest_big_city(coord):
    closest = float('inf')
    closest_key = None
    for city in big_cities:
        d = distance.distance(lonlat(*coord), lonlat(*big_cities[city])).km
        #d = distance.distance((y1,x1), (y2,x2)).km
        if d < closest:
            closest = d
            closest_key = city
    return (closest_key, round(closest, 2))


def get_location(coord):
    tmp_str = coord.split(" ")
    (lon, lat) = (float(tmp_str[0][6:]), float(tmp_str[1][:-1]))
    lat_limit_south_to_middle = 58.879  # Norra vättern
    lat_limit_middle_to_north = 62.414361  # Sundsvall

    if(lat > lat_limit_middle_to_north):
        return "north"
    if(lat < lat_limit_south_to_middle):
        return "south"
    return "middle"


def get_all_facts():
    gr = pgf.readPGF(gf_path + 'Boroughs.pgf')
    factsys = FactSystem(labels, gr, lang)

    # factsys.run('../data/output.tsv',borough_texts_parsed)
    facts = factsys.run(query_data_path + 'boroughs.tsv',
                        borough_texts_embedded)
    return facts

# Returns a list of one fact, in multiple languages


def get_one_fact(row):
    gr = pgf.readPGF(gf_path + 'Boroughs.pgf')
    factsys = FactSystem(labels, gr, lang)
    facts, meta = factsys.run_one(query_data_path + 'boroughs.tsv', borough_texts_embedded, row)
    #print("Facts: ", facts)
    facts = [pp.post_process(a) for a in facts]
    #print("PPFacts: ", facts)
    return (facts, meta)



def main():
    facts = get_all_facts()
    print(facts)


if __name__ == "__main__":
    main()
    #test_famous_people()

    #lerum = (12.266468138, 57.768650894)
    #city, dist = closest_big_city(lerum)
    #bearing = get_bearing(big_cities[city], lerum)
    #print("Dist: ", dist, " - Bearing: ", bearing)
