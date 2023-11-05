# pip install sparqlwrapper
# https://rdflib.github.io/sparqlwrapper/

#ska finnas sätt att direkt querya TSV direkt men jag är för dum
import json
import sys
from SPARQLWrapper import SPARQLWrapper, JSON, TSV
from queries import *
import os
from dotenv import load_dotenv

load_dotenv()

gf_path = os.getenv("AW_GF")
python_path = os.getenv("AW_PYTHON")
query_data_path = os.getenv("AW_QUERY_DATA")

endpoint_url = "https://query.wikidata.org/sparql"

#lang = sys.argv[1]
#print(lang)

def clear_file(filename):
  try:
      with open(filename, "w") as outfile:
        outfile.write("")
        outfile.close()
  except IOError:
    print('oops!')
 
def append_to_file(filename, text):
  try:
      with open(filename, "a") as outfile:
          outfile.write(text + "\n")
          outfile.close()
  except IOError:
      print('oops!')

query = '''SELECT ?city ?cityLabelSv ?cityLabelEn ?cityLabelDe ?population (max(?area) as ?maxArea) ?coordinates (group_concat(distinct ?municipalityLabelSv; separator=", ") as ?muniLabels)
(group_concat(distinct ?municipality; separator=", ") as ?muniIds)
  WHERE
  {
    ?city wdt:P31 wd:Q12813115.
    ?city wdt:P17 wd:Q34.
    ?city wdt:P1082 ?population.
    ?city p:P2046 [pq:P585 ?dateArea; ps:P2046 ?area].
    ?city wdt:P625  ?coordinates. 
    ?city wdt:P131  ?municipality.
    ?municipality rdfs:label ?municipalityLabelSv.
    ?city rdfs:label ?cityLabelSv .
    ?city rdfs:label ?cityLabelEn .
    ?city rdfs:label ?cityLabelDe .
    filter(lang(?municipalityLabelSv) = 'sv') .
    filter(lang(?cityLabelSv) = 'sv') .
    filter(lang(?cityLabelEn) = 'en') .
    filter(lang(?cityLabelDe) = 'de') .
    FILTER NOT EXISTS {?city p:P2046 [pq:P585 ?dateArea_] FILTER (?dateArea_ > ?dateArea)}

  } group by ?city ?cityLabelSv ?population ?coordinates ?cityLabelEn ?cityLabelDe
  '''#.format(lang)


def get_results(endpoint_url, query):
    user_agent = "WDQS-example Python/%s.%s" % (sys.version_info[0], sys.version_info[1])
    # TODO adjust user agent; see https://w.wiki/CX6
    sparql = SPARQLWrapper(endpoint_url, agent=user_agent)
    sparql.setQuery(query)
    sparql.setReturnFormat(JSON)
    return sparql.query().convert()
  
def clean_results(res):
	pass

def datacleaner(filename, splitted_columns):
  f = open(filename, "r")
  new_filename = filename.split('.')[0] + "_data.tsv"
  
  i = 0

  clear_file(new_filename)

  for line in f.readlines():
    line = line.rstrip('\n')

    if (i == 0):
      i = i + 1
      append_to_file(new_filename, line)
      continue

    line_values = line.split('\t')

    for s in splitted_columns:
      line_values[s] = line_values[s].split('/')[-1]

    i = i + 1
    new_line = "\t".join(line_values)
    append_to_file(new_filename, new_line)

def update_boroughs():
  results = get_results(endpoint_url, query_boroughs)
  s = str(results).replace("\'", "\"")
  parsed = json.loads(s)
  #print(json.dumps(parsed, indent=4, sort_keys=True))
  clear_file("./query_data/boroughs.tsv")

  #bygger om json till tsv
  for entry in parsed['results']['bindings']:
      cityQ       = entry['city']['value'].split('/')[-1]      #q_value of a city in wikidata, taken from its url
      citylabelSv = entry['cityLabelSv']['value']              #city name in swedish
      citylabelEn = entry['cityLabelEn']['value']              #city name in english
      citylabelDe = entry['cityLabelDe']['value']              #city name in german
      population  = entry['population']['value']               #population in city
      area        = str(int(float(entry['maxArea']['value']))) #area, rounded down to nearest integer
      coordinates = entry['coordinates']['value']              #coordinates in long/lat?
      muniQ       = entry['muniIds']['value']                  #Q values for municipalities
      muniSv      = entry['muniLabels']['value']               #municipality name in swedish
      image       = entry['image']['value']

      row = [cityQ,
            citylabelSv,
            citylabelEn,
            citylabelDe,
            population,
            area,
            coordinates,
            muniQ,
            muniSv,
            image]

      text = "\t".join(row) #prints every element in row with an \t between them
      append_to_file("query_data/boroughs.tsv", text)

def update_persons():
  print("fetching data: started")

  result = get_results(endpoint_url, query_persons)
  s = str(result).replace("\'", "\"")

  print("----------------------------")
  print("----------------------------")

  parsed_persons = json.loads(s)
  
  print("fetching data: done")
  clear_file("./query_data/persons.tsv")

  #bygger om json till tsv
  for entry in parsed_persons['results']['bindings']:
      personLabelSv       = entry['personLabelSv']['value']      
      cityOfBirth = entry['cityOfBirth']['value'].split('/')[-1]  #q_value of a city in wikidata, taken from its url
      occupationLabelsSv = entry['occupationLabelsSv']['value']   
      sitelinks = entry['sitelinks']['value']

      row = [personLabelSv, cityOfBirth, occupationLabelsSv, sitelinks]

      text = "\t".join(row) #prints every element in row with an \t between them
      append_to_file("query_data/persons.tsv", text)

def update_sportclubs():
  print("fetching data: started")

  result = get_results(endpoint_url, query_sportclubs)
  s = str(result).replace("\'", "\"")
  parsed_sportsclubs = json.loads(s)
  
  print("fetching data: done")

  clear_file("query_data/sportclubs.tsv")

  #bygger om json till tsv
  for entry in parsed_sportsclubs['results']['bindings']:
      item       = entry['item']['value'].split('/')[-1]     
      itemLabelSv = entry['itemLabelSv']['value']  #q_value of a city in wikidata, taken from its url
      city = entry['city']['value'].split('/')[-1]
      cityLabelSv = entry['cityLabelSv']['value']   
      inception = entry['inception']['value'].split('T')[0]   
      sportIds = entry['sportIds']['value'].split('/')[-1]
      sports = entry['sports']['value']
      sitelinks = entry['sitelinks']['value']

      row = [
        item,
        itemLabelSv,
        city,
        cityLabelSv,
        inception,
        sportIds,
        sports,
        sitelinks]

      text = "\t".join(row) #prints every element in row with an \t between them
      append_to_file("query_data/sportclubs.tsv", text)
      

  

def update_buildings():
  print("fetching data: started")

  result = get_results(endpoint_url, query_buildings)
  s = str(result).replace("\'", "\"")
  parsed_buildings = json.loads(s)
  
  print("fetching data: done")

  clear_file("query_data/buildings.tsv")

  #bygger om json till tsv
  for entry in parsed_buildings['results']['bindings']:
      item       = entry['item']['value'].split('/')[-1]     
      itemLabelSv = entry['itemLabelSv']['value']  #q_value of a city in wikidata, taken from its url
      city = entry['city']['value'].split('/')[-1]
      inception = entry['inception']['value'].split('T')[0]
      sitelinks = entry['sitelinks']['value']

      row = [
        item,
        itemLabelSv,
        city,
        inception,
        sitelinks]

      text = "\t".join(row) #prints every element in row with an \t between them
      append_to_file("query_data/buildings.tsv", text)
      
def update_events():
  print("fetching data: started")

  result = get_results(endpoint_url, query_events)
  s = str(result).replace("\'", "\"")
  parsed_events = json.loads(s)
  
  print("fetching data: done")
  
  clear_file("query_data/events.tsv")

  #bygger om json till tsv
  for entry in parsed_events['results']['bindings']:
    city = entry['city']['value'].split('/')[-1]  #q_value of a city in wikidata, taken from its url      
    item = entry['item']['value'].split('/')[-1]  #q_value of a city in wikidata, taken from its url
    itemLabelSv = entry['itemLabelSv']['value']
    cityLabelSv = entry['cityLabelSv']['value']   
    sitelinks = str(int(float(entry['sitelinks']['value'])))

    row = [city, item, sitelinks, itemLabelSv, cityLabelSv]

    text = "\t".join(row) #prints every element in row with an \t between them
    append_to_file("query_data/events.tsv", text)

#update_boroughs()
#update_sportclubs()
#update_buildings()
# update_persons()
#update_events()

datacleaner(query_data_path + "query_persons.tsv", [1])

