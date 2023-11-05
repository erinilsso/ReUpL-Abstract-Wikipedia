concrete MuniNamesGer of MuniNames = 

  open SyntaxGer, ParadigmsGer, Prelude in {

lincat MName = LocName ;

oper LocName = {np : NP ; isIn : Bool} ;

oper mkMName = overload {
  mkMName : Str -> LocName = \s -> {np = mkNP (mkPN s) ; isIn = True} ;
  mkMName : N -> LocName = \n -> {np = mkNP n ; isIn = True} ;
  mkMName : NP -> LocName = \np -> {np = np ; isIn = True} ;
  } ;

 exMName : LocName -> LocName = \name -> name ** {isIn = False} ;
 sgMName : LocName -> LocName = \name -> name ; ---- ** {np = forceNumberNP singular name.np} ;

-- #INSERT HERE# --
lin Q498470_MName = mkMName "Ale Gemeinde" ; 
lin Q511297_MName = mkMName "Vårgårda Gemeinde" ; 
lin Q149539_MName = mkMName "Sandvikens Gemeinde" ; 
lin Q307603_MName = mkMName "Övertorneå Gemeinde" ; 
lin Q59858_MName = mkMName "Älvkarleby Gemeinde" ; 
lin Q505085_MName = mkMName "Ovanåkers Gemeinde" ; 
lin Q109010_MName = mkMName "Solna Gemeinde" ; 
lin Q113718_MName = mkMName "Botkyrka Gemeinde" ; 
lin Q113679_MName = mkMName "Danderyds Gemeinde" ; 
lin Q113692_MName = mkMName "Haninge Gemeinde" ; 
lin Q113730_MName = mkMName "Tyresö Gemeinde" ; 
lin Q492575_MName = mkMName "Huddinge Gemeinde" ; 
lin Q493066_MName = mkMName "Täby Gemeinde" ; 
lin Q301259_MName = mkMName "Järfälla Gemeinde" ; 
lin Q506250_MName = mkMName "Stockholms Gemeinde" ; 
lin Q503746_MName = mkMName "Sollentuna Gemeinde" ; 
lin Q946647_MName = mkMName "Nacka Gemeinde" ; 
lin Q972564_MName = mkMName "Sundbybergs Gemeinde" ; 
lin Q214048_MName = mkMName "Norrtälje Gemeinde" ; 
lin Q493841_MName = mkMName "Värmdö Gemeinde" ; 
lin Q59093_MName = mkMName "Östhammars Gemeinde" ; 
lin Q29963_MName = mkMName "Hudiksvalls Gemeinde" ; 
lin Q42009_MName = mkMName "Köpings Gemeinde" ; 
lin Q52502_MName = mkMName "Göteborgs Gemeinde" ; 
lin Q499380_MName = mkMName "Kungsbacka Gemeinde" ; 
lin Q427422_MName = mkMName "Mariestads Gemeinde" ; 
lin Q501452_MName = mkMName "Skövde Gemeinde" ; 
lin Q498477_MName = mkMName "Hylte Gemeinde" ; 
lin Q179180_MName = mkMName "Varbergs Gemeinde" ; 
lin Q255025_MName = mkMName "Älvsbyns Gemeinde" ; 
lin Q27982_MName = mkMName "Flens Gemeinde" ; 
lin Q255206_MName = mkMName "Ängelholms Gemeinde" ; 
lin Q513370_MName = mkMName "Kävlinge Gemeinde" ; 
lin Q498857_MName = mkMName "Kristianstads Gemeinde" ; 
lin Q503188_MName = mkMName "Lerums Gemeinde" ; 
lin Q516080_MName = mkMName "Salems Gemeinde" ; 
lin Q10433726_MName = mkMName "Botkyrka landsGemeinde" ; 
lin Q10509949_MName = mkMName "Grödinge landsGemeinde" ; 
lin Q10660418_MName = mkMName "Salems Gemeinde (1971-73)" ; 
lin Q62464_MName = mkMName "Hofors Gemeinde" ; 
lin Q37462_MName = mkMName "Skinnskattebergs Gemeinde" ; 
lin Q266401_MName = mkMName "Höörs Gemeinde" ; 
lin Q504619_MName = mkMName "Hörby Gemeinde" ; 
lin Q201813_MName = mkMName "Åstorps Gemeinde" ; 
lin Q511310_MName = mkMName "Bjuvs Gemeinde" ; 
lin Q504227_MName = mkMName "Svalövs Gemeinde" ; 
lin Q502298_MName = mkMName "Landskrona Gemeinde" ; 
lin Q145835_MName = mkMName "Söderhamns Gemeinde" ; 
lin Q515505_MName = mkMName "Uppvidinge Gemeinde" ; 
lin Q515969_MName = mkMName "Vadstena Gemeinde" ; 
lin Q2642771_MName = mkMName "Gagnefs Gemeinde" ; 
lin Q511253_MName = mkMName "Håbo Gemeinde" ; 
lin Q186662_MName = mkMName "Burlövs Gemeinde" ; 
lin Q504266_MName = mkMName "Malung-Sälens Gemeinde" ; 
lin Q501463_MName = mkMName "Sorsele Gemeinde" ; 
lin Q500153_MName = mkMName "Marks Gemeinde" ; 
lin Q501424_MName = mkMName "Strömstads Gemeinde" ; 
lin Q499435_MName = mkMName "Karlsborgs Gemeinde" ; 
lin Q271153_MName = mkMName "Åre Gemeinde" ; 
lin Q503214_MName = mkMName "Falköpings Gemeinde" ; 
lin Q428749_MName = mkMName "Hjo Gemeinde" ; 
lin Q267030_MName = mkMName "Mjölby Gemeinde" ; 
lin Q298003_MName = mkMName "Örnsköldsviks Gemeinde" ; 
lin Q493815_MName = mkMName "Gällivare Gemeinde" ; 
lin Q505064_MName = mkMName "Trosa Gemeinde" ; 
lin Q510364_MName = mkMName "Kristinehamns Gemeinde" ; 
lin Q512002_MName = mkMName "Hultsfreds Gemeinde" ; 
lin Q509651_MName = mkMName "Leksands Gemeinde" ; 
lin Q504626_MName = mkMName "Simrishamns Gemeinde" ; 
lin Q504219_MName = mkMName "Trelleborgs Gemeinde" ; 
lin Q515266_MName = mkMName "Skurups Gemeinde" ; 
lin Q177019_MName = mkMName "Luleå Gemeinde" ; 
lin Q514707_MName = mkMName "Krokoms Gemeinde" ; 
lin Q499415_MName = mkMName "Storumans Gemeinde" ; 
lin Q117091_MName = mkMName "Kalix Gemeinde" ; 
lin Q505259_MName = mkMName "Gislaveds Gemeinde" ; 
lin Q508168_MName = mkMName "Falkenbergs Gemeinde" ; 
lin Q307569_MName = mkMName "Överkalix Gemeinde" ; 
lin Q515250_MName = mkMName "Mönsterås Gemeinde" ; 
lin Q493855_MName = mkMName "Arjeplogs Gemeinde" ; 
lin Q487502_MName = mkMName "Laholms Gemeinde" ; 
lin Q427991_MName = mkMName "Lomma Gemeinde" ; 
lin Q492614_MName = mkMName "Ekerö Gemeinde" ; 
lin Q501420_MName = mkMName "Sotenäs Gemeinde" ; 
lin Q186230_MName = mkMName "Pajala Gemeinde" ; 
lin Q254799_MName = mkMName "Älmhults Gemeinde" ; 
lin Q499421_MName = mkMName "Skara Gemeinde" ; 
lin Q499359_MName = mkMName "Hammarö Gemeinde" ; 
lin Q513421_MName = mkMName "Härjedalens Gemeinde" ; 
lin Q1130264_MName = mkMName "Eslövs Gemeinde" ; 
lin Q503102_MName = mkMName "Bollebygds Gemeinde" ; 
lin Q503173_MName = mkMName "Lysekils Gemeinde" ; 
lin Q500071_MName = mkMName "Avesta Gemeinde" ; 
lin Q501438_MName = mkMName "Melleruds Gemeinde" ; 
lin Q845930_MName = mkMName "Bergs Gemeinde" ; 
lin Q499474_MName = mkMName "Kiruna Gemeinde" ; 
lin Q285894_MName = mkMName "Nora Gemeinde" ; 
lin Q249378_MName = mkMName "Vingåkers Gemeinde" ; 
lin Q267462_MName = mkMName "Bengtsfors Gemeinde" ; 
lin Q499460_MName = mkMName "Nykvarns Gemeinde" ; 
lin Q509476_MName = mkMName "Bodens Gemeinde" ; 
lin Q505018_MName = mkMName "Lunds Gemeinde" ; 
lin Q504235_MName = mkMName "Ljungby Gemeinde" ; 
lin Q515477_MName = mkMName "Västerviks Gemeinde" ; 
lin Q505102_MName = mkMName "Ystads Gemeinde" ; 
lin Q504689_MName = mkMName "Jönköpings Gemeinde" ; 
lin Q430780_MName = mkMName "Skellefteå Gemeinde" ; 
lin Q507709_MName = mkMName "Umeå Gemeinde" ; 
lin Q499410_MName = mkMName "Linköpings Gemeinde" ; 
lin Q501532_MName = mkMName "Strängnäs Gemeinde" ; 
lin Q503184_MName = mkMName "Ludvika Gemeinde" ; 
lin Q505046_MName = mkMName "Smedjebackens Gemeinde" ; 
lin Q293970_MName = mkMName "Ödeshögs Gemeinde" ; 
lin Q297936_MName = mkMName "Örkelljunga Gemeinde" ; 
lin Q293928_MName = mkMName "Öckerö Gemeinde" ; 
lin Q501545_MName = mkMName "Falu Gemeinde" ; 
lin Q431271_MName = mkMName "Arboga Gemeinde" ; 
lin Q220881_MName = mkMName "Hällefors Gemeinde" ; 
lin Q10656505_MName = mkMName "Romaklosters landsGemeinde" ; 
lin Q510223_MName = mkMName "Karlshamns Gemeinde" ; 
lin Q509501_MName = mkMName "Askersunds Gemeinde" ; 
lin Q505109_MName = mkMName "Ockelbo Gemeinde" ; 
lin Q37399_MName = mkMName "Sala Gemeinde" ; 
lin Q271079_MName = mkMName "Åmåls Gemeinde" ; 
lin Q271107_MName = mkMName "Ånge Gemeinde" ; 
lin Q501448_MName = mkMName "Tjörns Gemeinde" ; 
lin Q503204_MName = mkMName "Filipstads Gemeinde" ; 
lin Q510310_MName = mkMName "Haparanda Gemeinde" ; 
lin Q505052_MName = mkMName "Vetlanda Gemeinde" ; 
lin Q505013_MName = mkMName "Höganäs Gemeinde" ; 
lin Q508125_MName = mkMName "Hässleholms Gemeinde" ; 
lin Q508140_MName = mkMName "Katrineholms Gemeinde" ; 
lin Q515699_MName = mkMName "Ydre Gemeinde" ; 
lin Q514756_MName = mkMName "Mörbylånga Gemeinde" ; 
lin Q511338_MName = mkMName "Vellinge Gemeinde" ; 
lin Q280562_MName = mkMName "Värnamo Gemeinde" ; 
lin Q271274_MName = mkMName "Åsele Gemeinde" ; 
lin Q271340_MName = mkMName "Åtvidabergs Gemeinde" ; 
lin Q504614_MName = mkMName "Klippans Gemeinde" ; 
lin Q504239_MName = mkMName "Mora Gemeinde" ; 
lin Q389040_MName = mkMName "Munkedals Gemeinde" ; 
lin Q376003_MName = mkMName "Bjurholms Gemeinde" ; 
lin Q514770_MName = mkMName "Strömsunds Gemeinde" ; 
lin Q514805_MName = mkMName "Nordanstigs Gemeinde" ; 
lin Q515373_MName = mkMName "Ronneby Gemeinde" ; 
lin Q503361_MName = mkMName "Malmö Gemeinde" ; 
lin Q510198_MName = mkMName "Tierps Gemeinde" ; 
lin Q505057_MName = mkMName "Vimmerby Gemeinde" ; 
lin Q505096_MName = mkMName "Nässjö Gemeinde" ; 
lin Q507644_MName = mkMName "Norsjö Gemeinde" ; 
lin Q47018_MName = mkMName "Fagersta Gemeinde" ; 
lin Q505090_MName = mkMName "Nynäshamns Gemeinde" ; 
lin Q504692_MName = mkMName "Halmstads Gemeinde" ; 
lin Q511394_MName = mkMName "Kungälvs Gemeinde" ; 
lin Q505006_MName = mkMName "Oskarshamns Gemeinde" ; 
lin Q504988_MName = mkMName "Kumla Gemeinde" ; 
lin Q511326_MName = mkMName "Säffle Gemeinde" ; 
lin Q504630_MName = mkMName "Orsa Gemeinde" ; 
lin Q504676_MName = mkMName "Norrköpings Gemeinde" ; 
lin Q62469_MName = mkMName "Bollnäs Gemeinde" ; 
lin Q123855_MName = mkMName "Älvdalens Gemeinde" ; 
lin Q514815_MName = mkMName "Kramfors Gemeinde" ; 
lin Q512048_MName = mkMName "Jokkmokks Gemeinde" ; 
lin Q221990_MName = mkMName "Sollefteå Gemeinde" ; 
lin Q507684_MName = mkMName "Hedemora Gemeinde" ; 
lin Q514858_MName = mkMName "Lindesbergs Gemeinde" ; 
lin Q2777887_MName = mkMName "Årjängs Gemeinde" ; 
lin Q511228_MName = mkMName "Tanums Gemeinde" ; 
lin Q501459_MName = mkMName "Tidaholms Gemeinde" ; 
lin Q511365_MName = mkMName "Arvika Gemeinde" ; 
lin Q605329_MName = mkMName "Vaggeryds Gemeinde" ; 
lin Q510135_MName = mkMName "Torsby Gemeinde" ; 
lin Q307370_MName = mkMName "Östra Göinge Gemeinde" ; 
lin Q306789_MName = mkMName "Östersunds Gemeinde" ; 
lin Q1128384_MName = mkMName "Karlskrona Gemeinde" ; 
lin Q515706_MName = mkMName "Svedala Gemeinde" ; 
lin Q113673_MName = mkMName "Upplands-Bro Gemeinde" ; 
lin Q515680_MName = mkMName "Söderköpings Gemeinde" ; 
lin Q498453_MName = mkMName "Karlstads Gemeinde" ; 
lin Q239332_MName = mkMName "Gnesta Gemeinde" ; 
lin Q500090_MName = mkMName "Vaxholms Gemeinde" ; 
lin Q503209_MName = mkMName "Borlänge Gemeinde" ; 
lin Q501526_MName = mkMName "Vallentuna Gemeinde" ; 
lin Q504244_MName = mkMName "Rättviks Gemeinde" ; 
lin Q503167_MName = mkMName "Aneby Gemeinde" ; 
lin Q894327_MName = mkMName "Borås Gemeinde" ; 
lin Q509546_MName = mkMName "Borgholms Gemeinde" ; 
lin Q503122_MName = mkMName "Grums Gemeinde" ; 
lin Q117728_MName = mkMName "Österåkers Gemeinde" ; 
lin Q504601_MName = mkMName "Sjöbo Gemeinde" ; 
lin Q504261_MName = mkMName "Bräcke Gemeinde" ; 
lin Q504257_MName = mkMName "Olofströms Gemeinde" ; 
lin Q501551_MName = mkMName "Vansbro Gemeinde" ; 
lin Q47019_MName = mkMName "Hallstahammars Gemeinde" ; 
lin Q509514_MName = mkMName "Boxholms Gemeinde" ; 
lin Q515409_MName = mkMName "Sölvesborgs Gemeinde" ; 
lin Q505239_MName = mkMName "Sävsjö Gemeinde" ; 
lin Q47169_MName = mkMName "Kungsörs Gemeinde" ; 
lin Q505071_MName = mkMName "Tranås Gemeinde" ; 
lin Q297718_MName = mkMName "Örebro Gemeinde" ; 
lin Q515282_MName = mkMName "Lekebergs Gemeinde" ; 
lin Q37404_MName = mkMName "Norbergs Gemeinde" ; 
lin Q1345439_MName = mkMName "Säters Gemeinde" ; 
lin Q514830_MName = mkMName "Bromölla Gemeinde" ; 
lin Q515318_MName = mkMName "Nybro Gemeinde" ; 
lin Q182007_MName = mkMName "Alvesta Gemeinde" ; 
lin Q948462_MName = mkMName "Lycksele Gemeinde" ; 
lin Q515519_MName = mkMName "Tomelilla Gemeinde" ; 
lin Q503144_MName = mkMName "Eskilstuna Gemeinde" ; 
lin Q516336_MName = mkMName "Södertälje Gemeinde" ; 
lin Q508108_MName = mkMName "Motala Gemeinde" ; 
lin Q515342_MName = mkMName "Ragunda Gemeinde" ; 
lin Q510233_MName = mkMName "Högsby Gemeinde" ; 
lin Q511281_MName = mkMName "Götene Gemeinde" ; 
lin Q487648_MName = mkMName "Helsingborgs Gemeinde" ; 
lin Q511426_MName = mkMName "Vänersborgs Gemeinde" ; 
lin Q507656_MName = mkMName "Piteå Gemeinde" ; 
lin Q504994_MName = mkMName "Sundsvalls Gemeinde" ; 
lin Q501479_MName = mkMName "Tranemo Gemeinde" ; 
lin Q515861_MName = mkMName "Vilhelmina Gemeinde" ; 
lin Q499404_MName = mkMName "Arvidsjaurs Gemeinde" ; 
lin Q501432_MName = mkMName "Tibro Gemeinde" ; 
lin Q499441_MName = mkMName "Färgelanda Gemeinde" ; 
lin Q501470_MName = mkMName "Töreboda Gemeinde" ; 
lin Q516308_MName = mkMName "Heby Gemeinde" ; 
lin Q509997_MName = mkMName "Valdemarsviks Gemeinde" ; 
lin Q515491_MName = mkMName "Tingsryds Gemeinde" ; 
lin Q509568_MName = mkMName "Enköpings Gemeinde" ; 
lin Q338752_MName = mkMName "Orusts Gemeinde" ; 
lin Q514739_MName = mkMName "Ljusnarsbergs Gemeinde" ; 
lin Q503193_MName = mkMName "Gullspångs Gemeinde" ; 
lin Q504594_MName = mkMName "Osby Gemeinde" ; 
lin Q17659829_MName = mkMName "Hietaniemi landsGemeinde" ; 
lin Q499464_MName = mkMName "Båstads Gemeinde" ; 
lin Q511407_MName = mkMName "Hagfors Gemeinde" ; 
lin Q59091_MName = mkMName "Uppsala Gemeinde" ; 
lin Q509469_MName = mkMName "Degerfors Gemeinde" ; 
lin Q511241_MName = mkMName "Lilla Edets Gemeinde" ; 
lin Q509609_MName = mkMName "Gnosjö Gemeinde" ; 
lin Q515299_MName = mkMName "Kinda Gemeinde" ; 
lin Q515235_MName = mkMName "Ljusdals Gemeinde" ; 
lin Q515551_MName = mkMName "Torsås Gemeinde" ; 
lin Q500267_MName = mkMName "Nyköpings Gemeinde" ; 
lin Q508153_MName = mkMName "Kalmar Gemeinde" ; 
lin Q501205_MName = mkMName "Sunne Gemeinde" ; 
lin Q504465_MName = mkMName "Knivsta Gemeinde" ; 
lin Q500217_MName = mkMName "Växjö Gemeinde" ; 
lin Q499385_MName = mkMName "Forshaga Gemeinde" ; 
lin Q499393_MName = mkMName "Kils Gemeinde" ; 
lin Q504983_MName = mkMName "Timrå Gemeinde" ; 
lin Q500210_MName = mkMName "Vännäs Gemeinde" ; 
lin Q503111_MName = mkMName "Herrljunga Gemeinde" ; 
lin Q505936_MName = mkMName "Storfors Gemeinde" ; 
lin Q504505_MName = mkMName "Vindelns Gemeinde" ; 
lin Q510010_MName = mkMName "Gävle Gemeinde" ; 
lin Q503132_MName = mkMName "Dals-Eds Gemeinde" ; 
lin Q209634_MName = mkMName "Härnösands Gemeinde" ; 
lin Q10431334_MName = mkMName "Blidö landsGemeinde" ; 
lin Q503180_MName = mkMName "Finspångs Gemeinde" ; 
lin Q498447_MName = mkMName "Eda Gemeinde" ; 
lin Q10571533_MName = mkMName "Lyhundra landsGemeinde" ; 
lin Q10718516_MName = mkMName "Vätö landsGemeinde" ; 
lin Q240574_MName = mkMName "Markaryds Gemeinde" ; 
lin Q509452_MName = mkMName "Emmaboda Gemeinde" ; 
lin Q504609_MName = mkMName "Staffanstorps Gemeinde" ; 
lin Q508180_MName = mkMName "Hallsbergs Gemeinde" ; 
lin Q34550_MName = mkMName "Västerås Gemeinde" ; 
lin Q515358_MName = mkMName "Lidköpings Gemeinde" ; 
lin Q10498158_MName = mkMName "Forsmarks landsGemeinde" ; 
lin Q501487_MName = mkMName "Svenljunga Gemeinde" ; 
lin Q132334_MName = mkMName "Dorotea Gemeinde" ; 
lin Q125222_MName = mkMName "Partille Gemeinde" ; 
lin Q512035_MName = mkMName "Eksjö Gemeinde" ; 
lin Q511438_MName = mkMName "Stenungsunds Gemeinde" ; 
lin Q10572370_MName = mkMName "Lärbro landsGemeinde" ; 
lin Q500125_MName = mkMName "Härryda Gemeinde" ; 
lin Q503198_MName = mkMName "Habo Gemeinde" ; 
lin Q501428_MName = mkMName "Vara Gemeinde" ; 
lin Q3120654_MName = mkMName "Lidingö Gemeinde" ; 
lin Q515326_MName = mkMName "Laxå Gemeinde" ; 
lin Q505076_MName = mkMName "Mullsjö Gemeinde" ; 
lin Q503127_MName = mkMName "Essunga Gemeinde" ; 
lin Q514722_MName = mkMName "Nordmalings Gemeinde" ; 
lin Q216915_MName = mkMName "Sigtuna Gemeinde" ; 
lin Q503162_MName = mkMName "Alingsås Gemeinde" ; 
lin Q10699069_MName = mkMName "Tjörns landsGemeinde" ; 
lin Q501442_MName = mkMName "Uddevalla Gemeinde" ; 
lin Q511270_MName = mkMName "Mölndals Gemeinde" ; 
lin Q504249_MName = mkMName "Perstorps Gemeinde" ; 
lin Q503148_MName = mkMName "Grästorps Gemeinde" ; 
lin Q10717936_MName = mkMName "Västerhaninge landsGemeinde" ; 
lin Q501494_MName = mkMName "Munkfors Gemeinde" ; 
lin Q507670_MName = mkMName "Robertsfors Gemeinde" ; 
lin Q10518096_MName = mkMName "Hargs landsGemeinde" ; 
lin Q10501031_MName = mkMName "Fårösunds landsGemeinde" ; 
lin Q34078_MName = mkMName "Surahammars Gemeinde" ; 
lin Q509488_MName = mkMName "Lessebo Gemeinde" ; 
lin Q382808_MName = mkMName "Ulricehamns Gemeinde" ; 
lin Q505246_MName = mkMName "Oxelösunds Gemeinde" ; 
lin Q499425_MName = mkMName "Upplands Väsby Gemeinde" ; 
lin Q10709912_MName = mkMName "Upplands-Väsby landsGemeinde" ; 
lin Q28532_MName = mkMName "Trollhättans Gemeinde" ; 
lin Q509634_MName = mkMName "Karlskoga Gemeinde" ; 
lin Q501540_MName = mkMName "Malå Gemeinde" ; 
lin Q10432968_MName = mkMName "Boo landsGemeinde" ; 
lin Q10678557_MName = mkMName "Stenkumla landsGemeinde" ; 
-- #END INSERT# --

}