query_boroughs = '''SELECT ?city ?cityLabelSv ?cityLabelEn ?cityLabelDe ?population (max(?area) as ?maxArea) ?coordinates (group_concat(distinct ?municipalityLabelSv; separator=", ") as ?muniLabels)
(group_concat(distinct ?municipality; separator=", ") as ?muniIds) ?image
  WHERE
  {
    ?city wdt:P31 wd:Q12813115.
    ?city wdt:P17 wd:Q34.
    ?city wdt:P1082 ?population.
    ?city p:P2046 [pq:P585 ?dateArea; ps:P2046 ?area].
    ?city wdt:P625  ?coordinates. 
    ?city wdt:P131  ?municipality.
    ?city wdt:P18 ?image.
    ?municipality rdfs:label ?municipalityLabelSv.
    ?city rdfs:label ?cityLabelSv .
    ?city rdfs:label ?cityLabelEn .
    ?city rdfs:label ?cityLabelDe .
    filter(lang(?municipalityLabelSv) = 'sv') .
    filter(lang(?cityLabelSv) = 'sv') .
    filter(lang(?cityLabelEn) = 'en') .
    filter(lang(?cityLabelDe) = 'de') .
    FILTER NOT EXISTS {?city p:P2046 [pq:P585 ?dateArea_] FILTER (?dateArea_ > ?dateArea)}

  } group by ?city ?cityLabelSv ?population ?coordinates ?cityLabelEn ?cityLabelDe ?image
  '''#.format(lang)

query_persons = '''select distinct ?personLabelSv ?cityOfBirth (group_concat(distinct ?occupationLabelSv; separator=", ") as ?occupationLabelsSv) (group_concat(distinct ?occupationLabelEn; separator=", ") as ?occupationLabelsEn) ?sitelinks
where {
  ?person             wdt:P31             wd:Q5;
                      rdfs:label          ?personLabelSv;
                      wdt:P19             ?cityOfBirth;
                      wdt:P106            ?occupation;
                      wikibase:sitelinks  ?sitelinks.

  ?cityOfBirth        wdt:P31             wd:Q12813115.

  ?occupation         rdfs:label          ?occupationLabelSv;
                      rdfs:label          ?occupationLabelEn.

  filter(lang(?personLabelSv) = 'sv').
  filter(lang(?occupationLabelSv) = 'sv').
  filter(lang(?occupationLabelEn) = 'en').

}
group by ?personLabelSv ?cityOfBirth ?sitelinks
order by desc(?sitelinks)
'''#.format(lang)
  
query_events = '''SELECT DISTINCT ?city ?item ?sitelinks ?itemLabelSv ?cityLabelSv
WHERE
{
  ?item      wdt:P31/wdt:P279*    wd:Q1656682;
             wdt:P276   ?city;
             rdfs:label ?itemLabelSv;

             wikibase:sitelinks ?sitelinks.

  ?city      wdt:P31   wd:Q12813115;
             rdfs:label          ?cityLabelSv.

  filter(lang(?itemLabelSv) = 'sv').
  filter(lang(?cityLabelSv) = 'sv').
} ORDER BY DESC (?sitelinks)
  '''#.format(lang)

query_buildings = '''SELECT DISTINCT ?item ?itemLabelSv ?city ?inception ?sitelinks
WHERE
{
  ?city wdt:P31 wd:Q12813115.
  
  ?item wdt:P276* ?city ;
  wdt:P571 ?inception;
  rdfs:label ?itemLabelSv;
  wikibase:sitelinks ?sitelinks.

  wd:Q41176 ^wdt:P279*/^wdt:P31 ?item .

  filter(lang(?itemLabelSv) = 'sv').
}
ORDER BY DESC (?sitelinks)
'''#.format(lang)

query_sportclubs = '''SELECT DISTINCT ?item ?itemLabelSv ?city ?cityLabelSv ?inception (group_concat(distinct ?sport; separator=", ") as ?sportIds)
(group_concat(distinct ?sportLabelSv; separator=", ") as ?sports) ?sitelinks
WHERE
{
  ?city wdt:P31 wd:Q12813115.

  ?item wdt:P159 ?city ;
  wdt:P571 ?inception;
  wdt:P641 ?sport;
  rdfs:label ?itemLabelSv;
  wikibase:sitelinks ?sitelinks.

  wd:Q847017 ^wdt:P279*/^wdt:P31 ?item .

  ?sport rdfs:label ?sportLabelSv.
  ?city rdfs:label ?cityLabelSv.
  filter(lang(?itemLabelSv) = 'sv').
  filter(lang(?sportLabelSv) = 'sv').
  filter(lang(?cityLabelSv) = 'sv').
}GROUP BY ?item ?itemLabelSv ?city ?cityLabelSv ?inception ?sitelinks
ORDER BY DESC (?sitelinks)
  '''#.format(lang)