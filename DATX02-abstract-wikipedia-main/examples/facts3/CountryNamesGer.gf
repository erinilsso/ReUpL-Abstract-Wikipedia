concrete CountryNamesGer of CountryNames = 

  open SyntaxGer, ParadigmsGer in {

lincat
  CName = NP ;
  CDName = {np : NP ; ap : AP} ;

oper mkCName = overload {
  mkCName : Str -> NP = \s -> mkNP (mkPN s) ;
  mkCName : NP -> NP = \np -> np ;
  } ;

 mkCDName = overload {
   mkCDName : Str -> Str -> CDName = \np,ap -> lin CDName {np = mkCName np ; ap = mkAP (mkA ap)} ;
   mkCDName : NP -> AP -> CDName = \np,ap -> lin CDName {np = np ; ap = ap} ;
  } ;

lin Africa_CDName = mkCDName "Afrika" "Afrikanisch" ;
lin Asia_CDName = mkCDName "Asien" "Asiatisch" ;
lin Central_America_CDName = mkCDName "Zentralamerika" "Zentralamerikanisch" ;
lin Europe_CDName = mkCDName "Europa" "Europäisch" ;
lin North_America_CDName = mkCDName "Nordamerika" "Nordamerikanisch" ;
lin South_America_CDName = mkCDName "Südamerika" "Südamerikanisch" ;
lin insular_Oceania_CDName = mkCDName "Ozeanien" "Ozeanisch" ;

lin 'Guinea-Bissau_CName' = mkCName "Guinea-Bissau" ;
lin 'Nur-Sultan_CName' = mkCName "Nur-Sultan" ;
lin 'Port-au-Prince_CName' = mkCName "Port-au-Prince" ;
lin 'Porto-Novo_CName' = mkCName "Porto-Novo" ;
lin 'St._George\'s_CName' = mkCName "St. George’s" ;
lin 'Washington,_D.C._CName' = mkCName "Washington, D.C." ;
lin Abu_Dhabi_CName = mkCName "Abu Dhabi" ;
lin Abuja_CName = mkCName "Abuja" ;
lin Accra_CName = mkCName "Accra" ;
lin Addis_Ababa_CName = mkCName "Addis Abeba" ;
lin Afghan_afghani_CName = mkCName "Afghani" ;
lin Afghanistan_CName = mkCName "Afghanistan" ;
lin Albania_CName = mkCName "Albanien" ;
lin Albanian_lek_CName = mkCName "Albanischer Lek" ;
lin Algeria_CName = mkCName "Algerien" ;
lin Algerian_dinar_CName = mkCName "algerischer Dinar" ;
lin Algiers_CName = mkCName "Algier" ;
lin Amman_CName = mkCName "Amman" ;
lin Amsterdam_CName = mkCName "Amsterdam" ;
lin Andorra_CName = mkCName "Andorra" ;
lin Andorra_la_Vella_CName = mkCName "Andorra la Vella" ;
lin Angola_CName = mkCName "Angola" ;
lin Ankara_CName = mkCName "Ankara" ;
lin Antananarivo_CName = mkCName "Antananarivo" ;
lin Antigua_and_Barbuda_CName = mkCName "Antigua und Barbuda" ;
lin Apia_CName = mkCName "Apia" ;
lin Argentina_CName = mkCName "Argentinien" ;
lin Argentine_peso_CName = mkCName "argentinischer Peso" ;
lin Armenia_CName = mkCName "Armenien" ;
lin Armenian_dram_CName = mkCName "Dram" ;
lin Ashgabat_CName = mkCName "Aşgabat" ;
lin Asmara_CName = mkCName "Asmara" ;
lin Asunción_CName = mkCName "Asunción" ;
lin Athens_CName = mkCName "Athen" ;
lin Australia_CName = mkCName "Australien" ;
lin Australian_dollar_CName = mkCName "Australischer Dollar" ;
lin Austria_CName = mkCName "Österreich" ;
lin Azerbaijan_CName = mkCName "Aserbaidschan" ;
lin Azerbaijani_manat_CName = mkCName "Aserbaidschan-Manat" ;
lin Baghdad_CName = mkCName "Bagdad" ;
lin Bahamian_dollar_CName = mkCName "Bahama-Dollar" ;
lin Bahrain_CName = mkCName "Bahrain" ;
lin Bahraini_dinar_CName = mkCName "Bahrain-Dinar" ;
lin Baku_CName = mkCName "Baku" ;
lin Bamako_CName = mkCName "Bamako" ;
lin Bandar_Seri_Begawan_CName = mkCName "Bandar Seri Begawan" ;
lin Bangkok_CName = mkCName "Bangkok" ;
lin Bangladesh_CName = mkCName "Bangladesch" ;
lin Bangladeshi_taka_CName = mkCName "Taka" ;
lin Bangui_CName = mkCName "Bangui" ;
lin Banjul_CName = mkCName "Banjul" ;
lin Barbadian_dollar_CName = mkCName "Barbados-Dollar" ;
lin Barbados_CName = mkCName "Barbados" ;
lin Basseterre_CName = mkCName "Basseterre" ;
lin Beijing_CName = mkCName "Peking" ;
lin Beirut_CName = mkCName "Beirut" ;
lin Belarus_CName = mkCName "Belarus" ;
lin Belarusian_ruble_CName = mkCName "weißrussischer Rubel" ;
lin Belgium_CName = mkCName "Belgien" ;
lin Belgrade_CName = mkCName "Belgrad" ;
lin Belize_CName = mkCName "Belize" ;
lin Belize_dollar_CName = mkCName "Belize-Dollar" ;
lin Belmopan_CName = mkCName "Belmopan" ;
lin Benin_CName = mkCName "Benin" ;
lin Berlin_CName = mkCName "Berlin" ;
lin Bern_CName = mkCName "Bern" ;
lin Bhutan_CName = mkCName "Bhutan" ;
lin Bishkek_CName = mkCName "Bischkek" ;
lin Bissau_CName = mkCName "Bissau" ;
lin Bogotá_CName = mkCName "Bogotá" ;
lin Bolivia_CName = mkCName "Bolivien" ;
lin Bosnia_and_Herzegovina_CName = mkCName "Bosnien und Herzegowina" ;
lin Botswana_CName = mkCName "Botswana" ;
lin Botswana_pula_CName = mkCName "botswanischer Pula" ;
lin Brasília_CName = mkCName "Brasília" ;
lin Bratislava_CName = mkCName "Bratislava" ;
lin Brazil_CName = mkCName "Brasilien" ;
lin Brazilian_real_CName = mkCName "brasilianischer Real" ;
lin Brazzaville_CName = mkCName "Brazzaville" ;
lin Bridgetown_CName = mkCName "Bridgetown" ;
lin Brunei_CName = mkCName "Brunei" ;
lin Brunei_dollar_CName = mkCName "Brunei-Dollar" ;
lin Bucharest_CName = mkCName "Bukarest" ;
lin Budapest_CName = mkCName "Budapest" ;
lin Buenos_Aires_CName = mkCName "Buenos Aires" ;
lin Bulgaria_CName = mkCName "Bulgarien" ;
lin Bulgarian_lev_CName = mkCName "Lew" ;
lin Burkina_Faso_CName = mkCName "Burkina Faso" ;
lin Burundi_CName = mkCName "Burundi" ;
lin Burundian_franc_CName = mkCName "Burundi-Franc" ;
lin Cairo_CName = mkCName "Kairo" ;
lin Cambodia_CName = mkCName "Kambodscha" ;
lin Cameroon_CName = mkCName "Kamerun" ;
lin Canada_CName = mkCName "Kanada" ;
lin Canadian_dollar_CName = mkCName "kanadischer Dollar" ;
lin Canberra_CName = mkCName "Canberra" ;
lin Cape_Verde_CName = mkCName "Kap Verde" ;
lin Cape_Verdean_escudo_CName = mkCName "Kap-Verde-Escudo" ;
lin Caracas_CName = mkCName "Caracas" ;
lin Castries_CName = mkCName "Castries" ;
lin Central_African_CFA_franc_CName = mkCName "CFA-Franc BEAC" ;
lin Central_African_Republic_CName = mkCName "Zentralafrikanische Republik" ;
lin Chad_CName = mkCName "Tschad" ;
lin Chile_CName = mkCName "Chile" ;
lin Chilean_peso_CName = mkCName "chilenischer Peso" ;
lin 'Chișinău_CName' = mkCName "Chișinău" ;
lin City_of_Brussels_CName = mkCName "Brüssel" ;
lin Colombia_CName = mkCName "Kolumbien" ;
lin Colombian_cincuenta_centavos_CName = mkCName "kolumbianischer Peso" ;
lin Colombo_CName = mkCName "Colombo" ;
lin Comorian_franc_CName = mkCName "Komoren-Franc" ;
lin Comoros_CName = mkCName "Komoren" ;
lin Conakry_CName = mkCName "Conakry" ;
lin Congolese_franc_CName = mkCName "Kongo-Franc" ;
lin Copenhagen_CName = mkCName "Kopenhagen" ;
lin Costa_Rica_CName = mkCName "Costa Rica" ;
lin Costa_Rican_colón_CName = mkCName "Costa-Rica-Colón" ;
lin Croatia_CName = mkCName "Kroatien" ;
lin Croatian_kuna_CName = mkCName "kroatische Kuna" ;
lin Cuba_CName = mkCName "Kuba" ;
lin Cuban_peso_CName = mkCName "kubanischer Peso" ;
lin Cyprus_CName = mkCName "Republik Zypern" ;
lin Czech_Republic_CName = mkCName "Tschechien" ;
lin Czech_koruna_CName = mkCName "tschechische Krone" ;
lin Dakar_CName = mkCName "Dakar" ;
lin Damascus_CName = mkCName "Damaskus" ;
lin Danish_krone_CName = mkCName "dänische Krone" ;
lin Democratic_Republic_of_the_Congo_CName = mkCName "Demokratische Republik Kongo" ;
lin Denmark_CName = mkCName "Dänemark" ;
lin Dhaka_CName = mkCName "Dhaka" ;
lin Dili_CName = mkCName "Dili" ;
lin Djibouti_CName = mkCName "Dschibuti" ;
lin Djiboutian_franc_CName = mkCName "Dschibuti-Franc" ;
lin Dodoma_CName = mkCName "Dodoma" ;
lin Doha_CName = mkCName "Doha" ;
lin Dominica_CName = mkCName "Dominica" ;
lin Dominican_Republic_CName = mkCName "Dominikanische Republik" ;
lin Dominican_peso_CName = mkCName "dominikanischer Peso" ;
lin Dublin_CName = mkCName "Dublin" ;
lin Dushanbe_CName = mkCName "Duschanbe" ;
lin East_Timor_CName = mkCName "Osttimor" ;
lin East_Timor_centavo_coins_CName = mkCName "East Timor centavo coins" ;
lin Eastern_Caribbean_dollar_CName = mkCName "Ostkaribischer Dollar" ;
lin Ecuador_CName = mkCName "Ecuador" ;
lin Egypt_CName = mkCName "Ägypten" ;
lin Egyptian_pound_CName = mkCName "ägyptisches Pfund" ;
lin El_Salvador_CName = mkCName "El Salvador" ;
lin Equatorial_Guinea_CName = mkCName "Äquatorialguinea" ;
lin Eritrea_CName = mkCName "Eritrea" ;
lin Estonia_CName = mkCName "Estland" ;
lin Eswatini_CName = mkCName "Eswatini" ;
lin Ethiopia_CName = mkCName "Äthiopien" ;
lin Federated_States_of_Micronesia_CName = mkCName "Föderierte Staaten von Mikronesien" ;
lin Fiji_CName = mkCName "Fidschi" ;
lin Fijian_dollar_CName = mkCName "Fidschi-Dollar" ;
lin Finland_CName = mkCName "Finnland" ;
lin France_CName = mkCName "Frankreich" ;
lin Freetown_CName = mkCName "Freetown" ;
lin Funafuti_CName = mkCName "Funafuti" ;
lin Gabon_CName = mkCName "Gabun" ;
lin Gaborone_CName = mkCName "Gaborone" ;
lin Georgetown_CName = mkCName "Georgetown" ;
lin Georgia_CName = mkCName "Georgien" ;
lin Georgian_lari_CName = mkCName "georgischer Lari" ;
lin Germany_CName = mkCName "Deutschland" ;
lin Ghana_CName = mkCName "Ghana" ;
lin Ghana_cedi_CName = mkCName "Cedi" ;
lin Gitega_CName = mkCName "Gitega" ;
lin Greece_CName = mkCName "Griechenland" ;
lin Grenada_CName = mkCName "Grenada" ;
lin Guatemala_CName = mkCName "Guatemala" ;
lin Guatemala_City_CName = mkCName "Guatemala-Stadt" ;
lin Guinea_CName = mkCName "Guinea" ;
lin Guinean_franc_CName = mkCName "Franc Guinéen" ;
lin Guyana_CName = mkCName "Guyana" ;
lin Guyanese_dollar_CName = mkCName "Guyana-Dollar" ;
lin Haiti_CName = mkCName "Haiti" ;
lin Hanoi_CName = mkCName "Hanoi" ;
lin Harare_CName = mkCName "Harare" ;
lin Havana_CName = mkCName "Havanna" ;
lin Helsinki_CName = mkCName "Helsinki" ;
lin Honduran_lempira_CName = mkCName "Lempira" ;
lin Honduras_CName = mkCName "Honduras" ;
lin Honiara_CName = mkCName "Honiara" ;
lin Hungary_CName = mkCName "Ungarn" ;
lin Iceland_CName = mkCName "Island" ;
lin Icelandic_króna_CName = mkCName "isländische Krone" ;
lin India_CName = mkCName "Indien" ;
lin Indian_rupee_CName = mkCName "Indische Rupie" ;
lin Indonesia_CName = mkCName "Indonesien" ;
lin Iran_CName = mkCName "Iran" ;
lin Iranian_rial_CName = mkCName "iranischer Rial" ;
lin Iraq_CName = mkCName "Irak" ;
lin Iraqi_dinar_CName = mkCName "irakischer Dinar" ;
lin Ireland_CName = mkCName "Irland" ;
lin Islamabad_CName = mkCName "Islamabad" ;
lin Israel_CName = mkCName "Israel" ;
lin Italy_CName = mkCName "Italien" ;
lin Ivory_Coast_CName = mkCName "Elfenbeinküste" ;
lin Jakarta_CName = mkCName "Jakarta" ;
lin Jamaica_CName = mkCName "Jamaika" ;
lin Jamaican_dollar_CName = mkCName "Jamaika-Dollar" ;
lin Japan_CName = mkCName "Japan" ;
lin Japanese_yen_CName = mkCName "Yen" ;
lin Jerusalem_CName = mkCName "Jerusalem" ;
lin Jordan_CName = mkCName "Jordanien" ;
lin Jordanian_dinar_CName = mkCName "jordanischer Dinar" ;
lin Juba_CName = mkCName "Juba" ;
lin Kabul_CName = mkCName "Kabul" ;
lin Kampala_CName = mkCName "Kampala" ;
lin Kathmandu_CName = mkCName "Kathmandu" ;
lin Kazakhstan_CName = mkCName "Kasachstan" ;
lin Kazakhstani_tenge_CName = mkCName "Tenge" ;
lin Kenya_CName = mkCName "Kenia" ;
lin Kenyan_shilling_CName = mkCName "Kenia-Schilling" ;
lin Khartoum_CName = mkCName "Khartum" ;
lin Kigali_CName = mkCName "Kigali" ;
lin Kingdom_of_the_Netherlands_CName = mkCName "Königreich der Niederlande" ;
lin Kingston_CName = mkCName "Kingston" ;
lin Kingstown_CName = mkCName "Kingstown" ;
lin Kinshasa_CName = mkCName "Kinshasa" ;
lin Kiribati_CName = mkCName "Kiribati" ;
lin Kiribati_dollar_CName = mkCName "Kiribati dollar" ;
lin Kuala_Lumpur_CName = mkCName "Kuala Lumpur" ;
lin Kuwait_CName = mkCName "Kuwait" ;
lin Kuwait_City_CName = mkCName "Kuwait" ;
lin Kuwaiti_dinar_CName = mkCName "Kuwait-Dinar" ;
lin Kyiv_CName = mkCName "Kiew" ;
lin Kyrgyzstan_CName = mkCName "Kirgisistan" ;
lin Kyrgyzstani_som_CName = mkCName "Som" ;
lin La_Paz_CName = mkCName "La Paz" ;
lin Lao_kip_CName = mkCName "Kip" ;
lin Laos_CName = mkCName "Laos" ;
lin Latvia_CName = mkCName "Lettland" ;
lin Lebanese_pound_CName = mkCName "libanesisches Pfund" ;
lin Lebanon_CName = mkCName "Libanon" ;
lin Lesotho_CName = mkCName "Lesotho" ;
lin Lesotho_loti_CName = mkCName "Lesothischer Loti" ;
lin Liberia_CName = mkCName "Liberia" ;
lin Liberian_dollar_CName = mkCName "Liberianischer Dollar" ;
lin Libreville_CName = mkCName "Libreville" ;
lin Libya_CName = mkCName "Libyen" ;
lin Libyan_dinar_CName = mkCName "libyscher Dinar" ;
lin Liechtenstein_CName = mkCName "Liechtenstein" ;
lin Lilongwe_CName = mkCName "Lilongwe" ;
lin Lima_CName = mkCName "Lima" ;
lin Lisbon_CName = mkCName "Lissabon" ;
lin Lithuania_CName = mkCName "Litauen" ;
lin Ljubljana_CName = mkCName "Ljubljana" ;
lin Lobamba_CName = mkCName "Lobamba" ;
lin Lomé_CName = mkCName "Lomé" ;
lin London_CName = mkCName "London" ;
lin Luanda_CName = mkCName "Luanda" ;
lin Lusaka_CName = mkCName "Lusaka" ;
lin Luxembourg_CName = mkCName "Luxemburg" ;
lin Madagascar_CName = mkCName "Madagaskar" ;
lin Madrid_CName = mkCName "Madrid" ;
lin Majuro_CName = mkCName "Majuro" ;
lin Malabo_CName = mkCName "Malabo" ;
lin Malawi_CName = mkCName "Malawi" ;
lin Malawian_kwacha_CName = mkCName "Malawi-Kwacha" ;
lin Malaysia_CName = mkCName "Malaysia" ;
lin Malaysian_ringgit_CName = mkCName "Ringgit" ;
lin Maldives_CName = mkCName "Malediven" ;
lin Maldivian_rufiyaa_CName = mkCName "Rufiyaa" ;
lin Mali_CName = mkCName "Mali" ;
lin Malta_CName = mkCName "Malta" ;
lin Malé_CName = mkCName "Malé" ;
lin Managua_CName = mkCName "Managua" ;
lin Manama_CName = mkCName "Manama" ;
lin Manila_CName = mkCName "Manila" ;
lin Maputo_CName = mkCName "Maputo" ;
lin Marshall_Islands_CName = mkCName "Marshallinseln" ;
lin Maseru_CName = mkCName "Maseru" ;
lin Mauritania_CName = mkCName "Mauretanien" ;
lin Mauritanian_ouguiya_CName = mkCName "Ouguiya" ;
lin Mauritian_rupee_CName = mkCName "Mauritius-Rupie" ;
lin Mauritius_CName = mkCName "Mauritius" ;
lin Mexican_peso_CName = mkCName "Mexikanischer Peso" ;
lin Mexico_CName = mkCName "Mexiko" ;
lin Mexico_City_CName = mkCName "Mexiko-Stadt" ;
lin Minsk_CName = mkCName "Minsk" ;
lin Mogadishu_CName = mkCName "Mogadischu" ;
lin Moldova_CName = mkCName "Republik Moldau" ;
lin Moldovan_leu_CName = mkCName "moldauischer Leu" ;
lin Monaco_CName = mkCName "Monaco" ;
lin Monaco_City_CName = mkCName "Monaco City" ;
lin Mongolia_CName = mkCName "Mongolei" ;
lin Monrovia_CName = mkCName "Monrovia" ;
lin Montenegro_CName = mkCName "Montenegro" ;
lin Montevideo_CName = mkCName "Montevideo" ;
lin Moroccan_dirham_CName = mkCName "Marokkanischer Dirham" ;
lin Morocco_CName = mkCName "Marokko" ;
lin Moroni_CName = mkCName "Moroni" ;
lin Moscow_CName = mkCName "Moskau" ;
lin Mozambican_metical_CName = mkCName "Metical" ;
lin Mozambique_CName = mkCName "Mosambik" ;
lin Muscat_CName = mkCName "Maskat" ;
lin Myanmar_CName = mkCName "Myanmar" ;
lin N'Djamena_CName = mkCName "N’Djamena" ;
lin Nairobi_CName = mkCName "Nairobi" ;
lin Namibia_CName = mkCName "Namibia" ;
lin Namibian_dollar_CName = mkCName "Namibia-Dollar" ;
lin Nassau_CName = mkCName "Nassau" ;
lin Nauru_CName = mkCName "Nauru" ;
lin Naypyidaw_CName = mkCName "Naypyidaw" ;
lin Nepal_CName = mkCName "Nepal" ;
lin Nepalese_rupee_CName = mkCName "Nepalesische Rupie" ;
lin New_Delhi_CName = mkCName "Neu-Delhi" ;
lin New_Taiwan_dollar_CName = mkCName "Neuer Taiwan-Dollar" ;
lin New_Zealand_CName = mkCName "Neuseeland" ;
lin New_Zealand_dollar_CName = mkCName "Neuseeland-Dollar" ;
lin Ngerulmud_CName = mkCName "Ngerulmud" ;
lin Niamey_CName = mkCName "Niamey" ;
lin Nicaragua_CName = mkCName "Nicaragua" ;
lin Nicaraguan_córdoba_CName = mkCName "Córdoba Oro" ;
lin Nicosia_CName = mkCName "Nikosia" ;
lin Niger_CName = mkCName "Niger" ;
lin Nigeria_CName = mkCName "Nigeria" ;
lin Nigerian_naira_CName = mkCName "Naira" ;
lin North_Korea_CName = mkCName "Nordkorea" ;
lin North_Korean_won_CName = mkCName "nordkoreanischer Won" ;
lin North_Macedonia_CName = mkCName "Nordmazedonien" ;
lin Norway_CName = mkCName "Norwegen" ;
lin Norwegian_krone_CName = mkCName "norwegische Krone" ;
lin Nouakchott_CName = mkCName "Nouakchott" ;
lin Nuku'alofa_CName = mkCName "Nukuʻalofa" ;
lin Oman_CName = mkCName "Oman" ;
lin Omani_rial_CName = mkCName "Omanischer Rial" ;
lin Oslo_CName = mkCName "Oslo" ;
lin Ottawa_CName = mkCName "Ottawa" ;
lin Ouagadougou_CName = mkCName "Ouagadougou" ;
lin Pakistan_CName = mkCName "Pakistan" ;
lin Pakistani_rupee_CName = mkCName "pakistanische Rupie" ;
lin Palau_CName = mkCName "Palau" ;
lin Palikir_CName = mkCName "Palikir" ;
lin Panama_CName = mkCName "Panama" ;
lin Panama_City_CName = mkCName "Panama-Stadt" ;
lin Panamanian_balboa_CName = mkCName "Panamaischer Balboa" ;
lin Papua_New_Guinea_CName = mkCName "Papua-Neuguinea" ;
lin Paraguay_CName = mkCName "Paraguay" ;
lin Paraguayan_guaraní_CName = mkCName "Paraguayischer Guaraní" ;
lin Paramaribo_CName = mkCName "Paramaribo" ;
lin Paris_CName = mkCName "Paris" ;
lin People's_Republic_of_China_CName = mkCName "Volksrepublik China" ;
lin Peru_CName = mkCName "Peru" ;
lin Peruvian_sol_CName = mkCName "Nuevo Sol" ;
lin Philippine_peso_CName = mkCName "philippinischer Peso" ;
lin Philippines_CName = mkCName "Philippinen" ;
lin Phnom_Penh_CName = mkCName "Phnom Penh" ;
lin Podgorica_CName = mkCName "Podgorica" ;
lin Poland_CName = mkCName "Polen" ;
lin Port_Louis_CName = mkCName "Port Louis" ;
lin Port_Moresby_CName = mkCName "Port Moresby" ;
lin Port_Vila_CName = mkCName "Port Vila" ;
lin Port_of_Spain_CName = mkCName "Port of Spain" ;
lin Portugal_CName = mkCName "Portugal" ;
lin Prague_CName = mkCName "Prag" ;
lin Praia_CName = mkCName "Praia" ;
lin Pretoria_CName = mkCName "Pretoria" ;
lin Pyongyang_CName = mkCName "Pjöngjang" ;
lin Qatar_CName = mkCName "Katar" ;
lin Qatari_riyal_CName = mkCName "Katar-Riyal" ;
lin Quito_CName = mkCName "Quito" ;
lin Rabat_CName = mkCName "Rabat" ;
lin Republic_of_the_Congo_CName = mkCName "Republik Kongo" ;
lin Reykjavík_CName = mkCName "Reykjavík" ;
lin Riga_CName = mkCName "Riga" ;
lin Riyadh_CName = mkCName "Riad" ;
lin Romania_CName = mkCName "Rumänien" ;
lin Romanian_leu_CName = mkCName "rumänischer Leu" ;
lin Rome_CName = mkCName "Rom" ;
lin Roseau_CName = mkCName "Roseau" ;
lin Russia_CName = mkCName "Russland" ;
lin Russian_ruble_CName = mkCName "russischer Rubel" ;
lin Rwanda_CName = mkCName "Ruanda" ;
lin Rwandan_franc_CName = mkCName "Ruanda-Franc" ;
lin Saint_John's_CName = mkCName "Saint John’s" ;
lin Saint_Kitts_and_Nevis_CName = mkCName "St. Kitts und Nevis" ;
lin Saint_Lucia_CName = mkCName "St. Lucia" ;
lin Saint_Vincent_and_the_Grenadines_CName = mkCName "St. Vincent und die Grenadinen" ;
lin Samoa_CName = mkCName "Samoa" ;
lin 'Samoan_tālā_CName' = mkCName "samoanischer Tala" ;
lin San_José_CName = mkCName "San José" ;
lin San_Marino_CName = mkCName "San Marino" ;
lin San_Salvador_CName = mkCName "San Salvador" ;
lin Sanaa_CName = mkCName "Sanaa" ;
lin Santiago_CName = mkCName "Santiago de Chile" ;
lin Santo_Domingo_CName = mkCName "Santo Domingo" ;
lin Sarajevo_CName = mkCName "Sarajevo" ;
lin Saudi_Arabia_CName = mkCName "Saudi-Arabien" ;
lin Saudi_riyal_CName = mkCName "Saudi-Rial" ;
lin Senegal_CName = mkCName "Senegal" ;
lin Seoul_CName = mkCName "Seoul" ;
lin Serbia_CName = mkCName "Serbien" ;
lin Serbian_dinar_CName = mkCName "serbischer Dinar" ;
lin Seychelles_CName = mkCName "Seychellen" ;
lin Seychellois_rupee_CName = mkCName "Seychellen-Rupie" ;
lin Sierra_Leone_CName = mkCName "Sierra Leone" ;
lin Sierra_Leonean_leone_CName = mkCName "Sierra-leonischer Leone" ;
lin Singapore_CName = mkCName "Singapur" ;
lin Singapore_dollar_CName = mkCName "Singapur-Dollar" ;
lin Skopje_CName = mkCName "Skopje" ;
lin Slovakia_CName = mkCName "Slowakei" ;
lin Slovenia_CName = mkCName "Slowenien" ;
lin Sofia_CName = mkCName "Sofia" ;
lin Solomon_Islands_CName = mkCName "Salomonen" ;
lin Solomon_Islands_dollar_CName = mkCName "Salomonen-Dollar" ;
lin Somali_shilling_CName = mkCName "Somalia-Schilling" ;
lin Somalia_CName = mkCName "Somalia" ;
lin South_Africa_CName = mkCName "Südafrika" ;
lin South_African_rand_CName = mkCName "südafrikanischer Rand" ;
lin South_Korea_CName = mkCName "Südkorea" ;
lin South_Korean_won_CName = mkCName "Südkoreanischer Won" ;
lin South_Sudan_CName = mkCName "Südsudan" ;
lin South_Sudanese_pound_CName = mkCName "südsudanesisches Pfund" ;
lin South_Tarawa_CName = mkCName "South Tarawa" ;
lin Sovereign_Bolivar_CName = mkCName "Sovereign Bolivar" ;
lin Spain_CName = mkCName "Spanien" ;
lin Sri_Lanka_CName = mkCName "Sri Lanka" ;
lin Sri_Lankan_rupee_CName = mkCName "Sri-Lanka-Rupie" ;
lin Stockholm_CName = mkCName "Stockholm" ;
lin Sudan_CName = mkCName "Sudan" ;
lin Sudanese_pound_CName = mkCName "sudanesisches Pfund" ;
lin Suriname_CName = mkCName "Suriname" ;
lin Surinamese_dollar_CName = mkCName "Suriname-Dollar" ;
lin Suva_CName = mkCName "Suva" ;
lin Sweden_CName = mkCName "Schweden" ;
lin Swedish_krona_CName = mkCName "schwedische Krone" ;
lin Swiss_franc_CName = mkCName "Schweizer Franken" ;
lin Switzerland_CName = mkCName (mkNP the_Det (mkN "Schweiz" feminine)) ;
lin Syria_CName = mkCName "Syrien" ;
lin Syrian_pound_CName = mkCName "syrische Lira" ;
lin São_Tomé_CName = mkCName "São Tomé" ;
lin São_Tomé_and_Príncipe_CName = mkCName "São Tomé und Príncipe" ;
lin São_Tomé_and_Príncipe_dobra_CName = mkCName "São-toméischer Dobra" ;
lin Taipei_CName = mkCName "Taipeh" ;
lin Taiwan_CName = mkCName "Republik China" ;
lin Tajikistan_CName = mkCName "Tadschikistan" ;
lin Tajikistani_somoni_CName = mkCName "Somoni" ;
lin Tallinn_CName = mkCName "Tallinn" ;
lin Tanzania_CName = mkCName "Tansania" ;
lin Tanzanian_shilling_CName = mkCName "Tansania-Schilling" ;
lin Tashkent_CName = mkCName "Taschkent" ;
lin Tbilisi_CName = mkCName "Tiflis" ;
lin Tegucigalpa_CName = mkCName "Tegucigalpa" ;
lin Tehran_CName = mkCName "Teheran" ;
lin Thailand_CName = mkCName "Thailand" ;
lin The_Bahamas_CName = mkCName "Bahamas" ;
lin The_Gambia_CName = mkCName "Gambia" ;
lin Thimphu_CName = mkCName "Thimphu" ;
lin Tirana_CName = mkCName "Tirana" ;
lin Togo_CName = mkCName "Togo" ;
lin Tokyo_CName = mkCName "Tokio" ;
lin Tonga_CName = mkCName "Tonga" ;
lin 'Tongan_paʻanga_CName' = mkCName "Paʻanga" ;
lin Trinidad_and_Tobago_CName = mkCName "Trinidad und Tobago" ;
lin Trinidad_and_Tobago_dollar_CName = mkCName "Trinidad-und-Tobago-Dollar" ;
lin Tripoli_CName = mkCName "Tripolis" ;
lin Tunis_CName = mkCName "Tunis" ;
lin Tunisia_CName = mkCName "Tunesien" ;
lin Tunisian_dinar_CName = mkCName "tunesischer Dinar" ;
lin Turkey_CName = mkCName "Türkei" ;
lin Turkish_lira_CName = mkCName "türkische Lira" ;
lin Turkmenistan_CName = mkCName "Turkmenistan" ;
lin Turkmenistan_manat_CName = mkCName "Turkmenistan-Manat" ;
lin Tuvalu_CName = mkCName "Tuvalu" ;
lin Tuvaluan_dollar_CName = mkCName "Tuvaluischer Dollar" ;
lin Uganda_CName = mkCName "Uganda" ;
lin Ugandan_shilling_CName = mkCName "Uganda-Schilling" ;
lin Ukraine_CName = mkCName "Ukraine" ;
lin Ulaanbaatar_CName = mkCName "Ulaanbaatar" ;
lin United_Arab_Emirates_CName = mkCName "Vereinigte Arabische Emirate" ;
lin United_Arab_Emirates_dirham_CName = mkCName "VAE-Dirham" ;
lin United_Kingdom_CName = mkCName (mkNP the_Det (mkCN (mkA "Vereinigt") (mkN "Königreich" neuter))) ;
lin United_States_dollar_CName = mkCName "US-Dollar" ;
lin United_States_of_America_CName = mkCName (mkNP thePl_Det (mkCN (mkA "Vereinigt") (mkN "Staat" "Staaten" masculine))) ;
lin Uruguay_CName = mkCName "Uruguay" ;
lin Uruguayan_peso_CName = mkCName "uruguayischer Peso" ;
lin Uzbekistan_CName = mkCName "Usbekistan" ;
lin Uzbekistani_som_CName = mkCName "Soʻm" ;
lin Vaduz_CName = mkCName "Vaduz" ;
lin Valletta_CName = mkCName "Valletta" ;
lin Vanuatu_CName = mkCName "Vanuatu" ;
lin Vanuatu_vatus_CName = mkCName "Vatu" ;
lin Venezuela_CName = mkCName "Venezuela" ;
lin Victoria_CName = mkCName "Victoria" ;
lin Vienna_CName = mkCName "Wien" ;
lin Vientiane_CName = mkCName "Vientiane" ;
lin Vietnam_CName = mkCName "Vietnam" ;
lin Vietnamese_dong_CName = mkCName "vietnamesischer Đồng" ;
lin Vilnius_CName = mkCName "Vilnius" ;
lin Warsaw_CName = mkCName "Warschau" ;
lin Wellington_CName = mkCName "Wellington" ;
lin West_African_CFA_franc_CName = mkCName "West African CFA franc" ;
lin Windhoek_CName = mkCName "Windhoek" ;
lin Yamoussoukro_CName = mkCName "Yamoussoukro" ;
lin Yaoundé_CName = mkCName "Yaoundé" ;
lin Yaren_District_CName = mkCName "Yaren" ;
lin Yemen_CName = mkCName "Jemen" ;
lin Yemeni_rial_CName = mkCName "Jemen-Rial" ;
lin Yerevan_CName = mkCName "Jerewan" ;
lin Zagreb_CName = mkCName "Zagreb" ;
lin Zambia_CName = mkCName "Sambia" ;
lin Zambian_kwacha_CName = mkCName "sambischer Kwacha" ;
lin Zimbabwe_CName = mkCName "Simbabwe" ;
lin ariary_CName = mkCName "Ariary" ;
lin baht_CName = mkCName "Baht" ;
lin birr_CName = mkCName "Äthiopischer Birr" ;
lin boliviano_CName = mkCName "Boliviano" ;
lin convertible_mark_CName = mkCName "konvertible Mark" ;
lin dalasi_CName = mkCName "Dalasi" ;
lin denar_CName = mkCName "nordmazedonischer Denar" ;
lin euro_CName = mkCName "Euro" ;
lin forint_CName = mkCName "Forint" ;
lin gourde_CName = mkCName "Gourde" ;
lin hryvnia_CName = mkCName "Hrywnja" ;
lin kina_CName = mkCName "Kina" ;
lin kwanza_CName = mkCName "Kwanza" ;
lin kyat_CName = mkCName "Kyat" ;
lin lilangeni_CName = mkCName "Lilangeni" ;
lin nakfa_CName = mkCName "eritreischer Nakfa" ;
lin new_shekel_CName = mkCName "Schekel" ;
lin ngultrum_CName = mkCName "Ngultrum" ;
lin pound_sterling_CName = mkCName "Pfund Sterling" ;
lin quetzal_CName = mkCName "Guatemaltekischer Quetzal" ;
lin renminbi_CName = mkCName "Renminbi" ;
lin riel_CName = mkCName "Kambodschanischer Riel" ;
lin rupiah_CName = mkCName "indonesische Rupiah" ;
lin tugrik_CName = mkCName "Tögrög" ;
lin 'złoty_CName' = mkCName "Złoty" ;
}