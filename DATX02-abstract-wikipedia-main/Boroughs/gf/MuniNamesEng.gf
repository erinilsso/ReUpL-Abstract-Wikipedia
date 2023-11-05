concrete MuniNamesEng of MuniNames = 

  open SyntaxEng, ParadigmsEng, Prelude in {

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
lin Q498470_MName = mkMName "Ale municipality" ; 
lin Q511297_MName = mkMName "Vårgårda municipality" ; 
lin Q149539_MName = mkMName "Sandvikens municipality" ; 
lin Q307603_MName = mkMName "Övertorneå municipality" ; 
lin Q59858_MName = mkMName "Älvkarleby municipality" ; 
lin Q505085_MName = mkMName "Ovanåkers municipality" ; 
lin Q109010_MName = mkMName "Solna municipality" ; 
lin Q113718_MName = mkMName "Botkyrka municipality" ; 
lin Q113679_MName = mkMName "Danderyds municipality" ; 
lin Q113692_MName = mkMName "Haninge municipality" ; 
lin Q113730_MName = mkMName "Tyresö municipality" ; 
lin Q492575_MName = mkMName "Huddinge municipality" ; 
lin Q493066_MName = mkMName "Täby municipality" ; 
lin Q301259_MName = mkMName "Järfälla municipality" ; 
lin Q506250_MName = mkMName "Stockholms municipality" ; 
lin Q503746_MName = mkMName "Sollentuna municipality" ; 
lin Q946647_MName = mkMName "Nacka municipality" ; 
lin Q972564_MName = mkMName "Sundbybergs municipality" ; 
lin Q214048_MName = mkMName "Norrtälje municipality" ; 
lin Q493841_MName = mkMName "Värmdö municipality" ; 
lin Q59093_MName = mkMName "Östhammars municipality" ; 
lin Q29963_MName = mkMName "Hudiksvalls municipality" ; 
lin Q42009_MName = mkMName "Köpings municipality" ; 
lin Q52502_MName = mkMName "Göteborgs municipality" ; 
lin Q499380_MName = mkMName "Kungsbacka municipality" ; 
lin Q427422_MName = mkMName "Mariestads municipality" ; 
lin Q501452_MName = mkMName "Skövde municipality" ; 
lin Q498477_MName = mkMName "Hylte municipality" ; 
lin Q179180_MName = mkMName "Varbergs municipality" ; 
lin Q255025_MName = mkMName "Älvsbyns municipality" ; 
lin Q27982_MName = mkMName "Flens municipality" ; 
lin Q255206_MName = mkMName "Ängelholms municipality" ; 
lin Q513370_MName = mkMName "Kävlinge municipality" ; 
lin Q498857_MName = mkMName "Kristianstads municipality" ; 
lin Q503188_MName = mkMName "Lerums municipality" ; 
lin Q516080_MName = mkMName "Salems municipality" ; 
lin Q10433726_MName = mkMName "Botkyrka landsmunicipality" ; 
lin Q10509949_MName = mkMName "Grödinge landsmunicipality" ; 
lin Q10660418_MName = mkMName "Salems municipality (1971-73)" ; 
lin Q62464_MName = mkMName "Hofors municipality" ; 
lin Q37462_MName = mkMName "Skinnskattebergs municipality" ; 
lin Q266401_MName = mkMName "Höörs municipality" ; 
lin Q504619_MName = mkMName "Hörby municipality" ; 
lin Q201813_MName = mkMName "Åstorps municipality" ; 
lin Q511310_MName = mkMName "Bjuvs municipality" ; 
lin Q504227_MName = mkMName "Svalövs municipality" ; 
lin Q502298_MName = mkMName "Landskrona municipality" ; 
lin Q145835_MName = mkMName "Söderhamns municipality" ; 
lin Q515505_MName = mkMName "Uppvidinge municipality" ; 
lin Q515969_MName = mkMName "Vadstena municipality" ; 
lin Q2642771_MName = mkMName "Gagnefs municipality" ; 
lin Q511253_MName = mkMName "Håbo municipality" ; 
lin Q186662_MName = mkMName "Burlövs municipality" ; 
lin Q504266_MName = mkMName "Malung-Sälens municipality" ; 
lin Q501463_MName = mkMName "Sorsele municipality" ; 
lin Q500153_MName = mkMName "Marks municipality" ; 
lin Q501424_MName = mkMName "Strömstads municipality" ; 
lin Q499435_MName = mkMName "Karlsborgs municipality" ; 
lin Q271153_MName = mkMName "Åre municipality" ; 
lin Q503214_MName = mkMName "Falköpings municipality" ; 
lin Q428749_MName = mkMName "Hjo municipality" ; 
lin Q267030_MName = mkMName "Mjölby municipality" ; 
lin Q298003_MName = mkMName "Örnsköldsviks municipality" ; 
lin Q493815_MName = mkMName "Gällivare municipality" ; 
lin Q505064_MName = mkMName "Trosa municipality" ; 
lin Q510364_MName = mkMName "Kristinehamns municipality" ; 
lin Q512002_MName = mkMName "Hultsfreds municipality" ; 
lin Q509651_MName = mkMName "Leksands municipality" ; 
lin Q504626_MName = mkMName "Simrishamns municipality" ; 
lin Q504219_MName = mkMName "Trelleborgs municipality" ; 
lin Q515266_MName = mkMName "Skurups municipality" ; 
lin Q177019_MName = mkMName "Luleå municipality" ; 
lin Q514707_MName = mkMName "Krokoms municipality" ; 
lin Q499415_MName = mkMName "Storumans municipality" ; 
lin Q117091_MName = mkMName "Kalix municipality" ; 
lin Q505259_MName = mkMName "Gislaveds municipality" ; 
lin Q508168_MName = mkMName "Falkenbergs municipality" ; 
lin Q307569_MName = mkMName "Överkalix municipality" ; 
lin Q515250_MName = mkMName "Mönsterås municipality" ; 
lin Q493855_MName = mkMName "Arjeplogs municipality" ; 
lin Q487502_MName = mkMName "Laholms municipality" ; 
lin Q427991_MName = mkMName "Lomma municipality" ; 
lin Q492614_MName = mkMName "Ekerö municipality" ; 
lin Q501420_MName = mkMName "Sotenäs municipality" ; 
lin Q186230_MName = mkMName "Pajala municipality" ; 
lin Q254799_MName = mkMName "Älmhults municipality" ; 
lin Q499421_MName = mkMName "Skara municipality" ; 
lin Q499359_MName = mkMName "Hammarö municipality" ; 
lin Q513421_MName = mkMName "Härjedalens municipality" ; 
lin Q1130264_MName = mkMName "Eslövs municipality" ; 
lin Q503102_MName = mkMName "Bollebygds municipality" ; 
lin Q503173_MName = mkMName "Lysekils municipality" ; 
lin Q500071_MName = mkMName "Avesta municipality" ; 
lin Q501438_MName = mkMName "Melleruds municipality" ; 
lin Q845930_MName = mkMName "Bergs municipality" ; 
lin Q499474_MName = mkMName "Kiruna municipality" ; 
lin Q285894_MName = mkMName "Nora municipality" ; 
lin Q249378_MName = mkMName "Vingåkers municipality" ; 
lin Q267462_MName = mkMName "Bengtsfors municipality" ; 
lin Q499460_MName = mkMName "Nykvarns municipality" ; 
lin Q509476_MName = mkMName "Bodens municipality" ; 
lin Q505018_MName = mkMName "Lunds municipality" ; 
lin Q504235_MName = mkMName "Ljungby municipality" ; 
lin Q515477_MName = mkMName "Västerviks municipality" ; 
lin Q505102_MName = mkMName "Ystads municipality" ; 
lin Q504689_MName = mkMName "Jönköpings municipality" ; 
lin Q430780_MName = mkMName "Skellefteå municipality" ; 
lin Q507709_MName = mkMName "Umeå municipality" ; 
lin Q499410_MName = mkMName "Linköpings municipality" ; 
lin Q501532_MName = mkMName "Strängnäs municipality" ; 
lin Q503184_MName = mkMName "Ludvika municipality" ; 
lin Q505046_MName = mkMName "Smedjebackens municipality" ; 
lin Q293970_MName = mkMName "Ödeshögs municipality" ; 
lin Q297936_MName = mkMName "Örkelljunga municipality" ; 
lin Q293928_MName = mkMName "Öckerö municipality" ; 
lin Q501545_MName = mkMName "Falu municipality" ; 
lin Q431271_MName = mkMName "Arboga municipality" ; 
lin Q220881_MName = mkMName "Hällefors municipality" ; 
lin Q10656505_MName = mkMName "Romaklosters landsmunicipality" ; 
lin Q510223_MName = mkMName "Karlshamns municipality" ; 
lin Q509501_MName = mkMName "Askersunds municipality" ; 
lin Q505109_MName = mkMName "Ockelbo municipality" ; 
lin Q37399_MName = mkMName "Sala municipality" ; 
lin Q271079_MName = mkMName "Åmåls municipality" ; 
lin Q271107_MName = mkMName "Ånge municipality" ; 
lin Q501448_MName = mkMName "Tjörns municipality" ; 
lin Q503204_MName = mkMName "Filipstads municipality" ; 
lin Q510310_MName = mkMName "Haparanda municipality" ; 
lin Q505052_MName = mkMName "Vetlanda municipality" ; 
lin Q505013_MName = mkMName "Höganäs municipality" ; 
lin Q508125_MName = mkMName "Hässleholms municipality" ; 
lin Q508140_MName = mkMName "Katrineholms municipality" ; 
lin Q515699_MName = mkMName "Ydre municipality" ; 
lin Q514756_MName = mkMName "Mörbylånga municipality" ; 
lin Q511338_MName = mkMName "Vellinge municipality" ; 
lin Q280562_MName = mkMName "Värnamo municipality" ; 
lin Q271274_MName = mkMName "Åsele municipality" ; 
lin Q271340_MName = mkMName "Åtvidabergs municipality" ; 
lin Q504614_MName = mkMName "Klippans municipality" ; 
lin Q504239_MName = mkMName "Mora municipality" ; 
lin Q389040_MName = mkMName "Munkedals municipality" ; 
lin Q376003_MName = mkMName "Bjurholms municipality" ; 
lin Q514770_MName = mkMName "Strömsunds municipality" ; 
lin Q514805_MName = mkMName "Nordanstigs municipality" ; 
lin Q515373_MName = mkMName "Ronneby municipality" ; 
lin Q503361_MName = mkMName "Malmö municipality" ; 
lin Q510198_MName = mkMName "Tierps municipality" ; 
lin Q505057_MName = mkMName "Vimmerby municipality" ; 
lin Q505096_MName = mkMName "Nässjö municipality" ; 
lin Q507644_MName = mkMName "Norsjö municipality" ; 
lin Q47018_MName = mkMName "Fagersta municipality" ; 
lin Q505090_MName = mkMName "Nynäshamns municipality" ; 
lin Q504692_MName = mkMName "Halmstads municipality" ; 
lin Q511394_MName = mkMName "Kungälvs municipality" ; 
lin Q505006_MName = mkMName "Oskarshamns municipality" ; 
lin Q504988_MName = mkMName "Kumla municipality" ; 
lin Q511326_MName = mkMName "Säffle municipality" ; 
lin Q504630_MName = mkMName "Orsa municipality" ; 
lin Q504676_MName = mkMName "Norrköpings municipality" ; 
lin Q62469_MName = mkMName "Bollnäs municipality" ; 
lin Q123855_MName = mkMName "Älvdalens municipality" ; 
lin Q514815_MName = mkMName "Kramfors municipality" ; 
lin Q512048_MName = mkMName "Jokkmokks municipality" ; 
lin Q221990_MName = mkMName "Sollefteå municipality" ; 
lin Q507684_MName = mkMName "Hedemora municipality" ; 
lin Q514858_MName = mkMName "Lindesbergs municipality" ; 
lin Q2777887_MName = mkMName "Årjängs municipality" ; 
lin Q511228_MName = mkMName "Tanums municipality" ; 
lin Q501459_MName = mkMName "Tidaholms municipality" ; 
lin Q511365_MName = mkMName "Arvika municipality" ; 
lin Q605329_MName = mkMName "Vaggeryds municipality" ; 
lin Q510135_MName = mkMName "Torsby municipality" ; 
lin Q307370_MName = mkMName "Östra Göinge municipality" ; 
lin Q306789_MName = mkMName "Östersunds municipality" ; 
lin Q1128384_MName = mkMName "Karlskrona municipality" ; 
lin Q515706_MName = mkMName "Svedala municipality" ; 
lin Q113673_MName = mkMName "Upplands-Bro municipality" ; 
lin Q515680_MName = mkMName "Söderköpings municipality" ; 
lin Q498453_MName = mkMName "Karlstads municipality" ; 
lin Q239332_MName = mkMName "Gnesta municipality" ; 
lin Q500090_MName = mkMName "Vaxholms municipality" ; 
lin Q503209_MName = mkMName "Borlänge municipality" ; 
lin Q501526_MName = mkMName "Vallentuna municipality" ; 
lin Q504244_MName = mkMName "Rättviks municipality" ; 
lin Q503167_MName = mkMName "Aneby municipality" ; 
lin Q894327_MName = mkMName "Borås municipality" ; 
lin Q509546_MName = mkMName "Borgholms municipality" ; 
lin Q503122_MName = mkMName "Grums municipality" ; 
lin Q117728_MName = mkMName "Österåkers municipality" ; 
lin Q504601_MName = mkMName "Sjöbo municipality" ; 
lin Q504261_MName = mkMName "Bräcke municipality" ; 
lin Q504257_MName = mkMName "Olofströms municipality" ; 
lin Q501551_MName = mkMName "Vansbro municipality" ; 
lin Q47019_MName = mkMName "Hallstahammars municipality" ; 
lin Q509514_MName = mkMName "Boxholms municipality" ; 
lin Q515409_MName = mkMName "Sölvesborgs municipality" ; 
lin Q505239_MName = mkMName "Sävsjö municipality" ; 
lin Q47169_MName = mkMName "Kungsörs municipality" ; 
lin Q505071_MName = mkMName "Tranås municipality" ; 
lin Q297718_MName = mkMName "Örebro municipality" ; 
lin Q515282_MName = mkMName "Lekebergs municipality" ; 
lin Q37404_MName = mkMName "Norbergs municipality" ; 
lin Q1345439_MName = mkMName "Säters municipality" ; 
lin Q514830_MName = mkMName "Bromölla municipality" ; 
lin Q515318_MName = mkMName "Nybro municipality" ; 
lin Q182007_MName = mkMName "Alvesta municipality" ; 
lin Q948462_MName = mkMName "Lycksele municipality" ; 
lin Q515519_MName = mkMName "Tomelilla municipality" ; 
lin Q503144_MName = mkMName "Eskilstuna municipality" ; 
lin Q516336_MName = mkMName "Södertälje municipality" ; 
lin Q508108_MName = mkMName "Motala municipality" ; 
lin Q515342_MName = mkMName "Ragunda municipality" ; 
lin Q510233_MName = mkMName "Högsby municipality" ; 
lin Q511281_MName = mkMName "Götene municipality" ; 
lin Q487648_MName = mkMName "Helsingborgs municipality" ; 
lin Q511426_MName = mkMName "Vänersborgs municipality" ; 
lin Q507656_MName = mkMName "Piteå municipality" ; 
lin Q504994_MName = mkMName "Sundsvalls municipality" ; 
lin Q501479_MName = mkMName "Tranemo municipality" ; 
lin Q515861_MName = mkMName "Vilhelmina municipality" ; 
lin Q499404_MName = mkMName "Arvidsjaurs municipality" ; 
lin Q501432_MName = mkMName "Tibro municipality" ; 
lin Q499441_MName = mkMName "Färgelanda municipality" ; 
lin Q501470_MName = mkMName "Töreboda municipality" ; 
lin Q516308_MName = mkMName "Heby municipality" ; 
lin Q509997_MName = mkMName "Valdemarsviks municipality" ; 
lin Q515491_MName = mkMName "Tingsryds municipality" ; 
lin Q509568_MName = mkMName "Enköpings municipality" ; 
lin Q338752_MName = mkMName "Orusts municipality" ; 
lin Q514739_MName = mkMName "Ljusnarsbergs municipality" ; 
lin Q503193_MName = mkMName "Gullspångs municipality" ; 
lin Q504594_MName = mkMName "Osby municipality" ; 
lin Q17659829_MName = mkMName "Hietaniemi landsmunicipality" ; 
lin Q499464_MName = mkMName "Båstads municipality" ; 
lin Q511407_MName = mkMName "Hagfors municipality" ; 
lin Q59091_MName = mkMName "Uppsala municipality" ; 
lin Q509469_MName = mkMName "Degerfors municipality" ; 
lin Q511241_MName = mkMName "Lilla Edets municipality" ; 
lin Q509609_MName = mkMName "Gnosjö municipality" ; 
lin Q515299_MName = mkMName "Kinda municipality" ; 
lin Q515235_MName = mkMName "Ljusdals municipality" ; 
lin Q515551_MName = mkMName "Torsås municipality" ; 
lin Q500267_MName = mkMName "Nyköpings municipality" ; 
lin Q508153_MName = mkMName "Kalmar municipality" ; 
lin Q501205_MName = mkMName "Sunne municipality" ; 
lin Q504465_MName = mkMName "Knivsta municipality" ; 
lin Q500217_MName = mkMName "Växjö municipality" ; 
lin Q499385_MName = mkMName "Forshaga municipality" ; 
lin Q499393_MName = mkMName "Kils municipality" ; 
lin Q504983_MName = mkMName "Timrå municipality" ; 
lin Q500210_MName = mkMName "Vännäs municipality" ; 
lin Q503111_MName = mkMName "Herrljunga municipality" ; 
lin Q505936_MName = mkMName "Storfors municipality" ; 
lin Q504505_MName = mkMName "Vindelns municipality" ; 
lin Q510010_MName = mkMName "Gävle municipality" ; 
lin Q503132_MName = mkMName "Dals-Eds municipality" ; 
lin Q209634_MName = mkMName "Härnösands municipality" ; 
lin Q10431334_MName = mkMName "Blidö landsmunicipality" ; 
lin Q503180_MName = mkMName "Finspångs municipality" ; 
lin Q498447_MName = mkMName "Eda municipality" ; 
lin Q10571533_MName = mkMName "Lyhundra landsmunicipality" ; 
lin Q10718516_MName = mkMName "Vätö landsmunicipality" ; 
lin Q240574_MName = mkMName "Markaryds municipality" ; 
lin Q509452_MName = mkMName "Emmaboda municipality" ; 
lin Q504609_MName = mkMName "Staffanstorps municipality" ; 
lin Q508180_MName = mkMName "Hallsbergs municipality" ; 
lin Q34550_MName = mkMName "Västerås municipality" ; 
lin Q515358_MName = mkMName "Lidköpings municipality" ; 
lin Q10498158_MName = mkMName "Forsmarks landsmunicipality" ; 
lin Q501487_MName = mkMName "Svenljunga municipality" ; 
lin Q132334_MName = mkMName "Dorotea municipality" ; 
lin Q125222_MName = mkMName "Partille municipality" ; 
lin Q512035_MName = mkMName "Eksjö municipality" ; 
lin Q511438_MName = mkMName "Stenungsunds municipality" ; 
lin Q10572370_MName = mkMName "Lärbro landsmunicipality" ; 
lin Q500125_MName = mkMName "Härryda municipality" ; 
lin Q503198_MName = mkMName "Habo municipality" ; 
lin Q501428_MName = mkMName "Vara municipality" ; 
lin Q3120654_MName = mkMName "Lidingö municipality" ; 
lin Q515326_MName = mkMName "Laxå municipality" ; 
lin Q505076_MName = mkMName "Mullsjö municipality" ; 
lin Q503127_MName = mkMName "Essunga municipality" ; 
lin Q514722_MName = mkMName "Nordmalings municipality" ; 
lin Q216915_MName = mkMName "Sigtuna municipality" ; 
lin Q503162_MName = mkMName "Alingsås municipality" ; 
lin Q10699069_MName = mkMName "Tjörns landsmunicipality" ; 
lin Q501442_MName = mkMName "Uddevalla municipality" ; 
lin Q511270_MName = mkMName "Mölndals municipality" ; 
lin Q504249_MName = mkMName "Perstorps municipality" ; 
lin Q503148_MName = mkMName "Grästorps municipality" ; 
lin Q10717936_MName = mkMName "Västerhaninge landsmunicipality" ; 
lin Q501494_MName = mkMName "Munkfors municipality" ; 
lin Q507670_MName = mkMName "Robertsfors municipality" ; 
lin Q10518096_MName = mkMName "Hargs landsmunicipality" ; 
lin Q10501031_MName = mkMName "Fårösunds landsmunicipality" ; 
lin Q34078_MName = mkMName "Surahammars municipality" ; 
lin Q509488_MName = mkMName "Lessebo municipality" ; 
lin Q382808_MName = mkMName "Ulricehamns municipality" ; 
lin Q505246_MName = mkMName "Oxelösunds municipality" ; 
lin Q499425_MName = mkMName "Upplands Väsby municipality" ; 
lin Q10709912_MName = mkMName "Upplands-Väsby landsmunicipality" ; 
lin Q28532_MName = mkMName "Trollhättans municipality" ; 
lin Q509634_MName = mkMName "Karlskoga municipality" ; 
lin Q501540_MName = mkMName "Malå municipality" ; 
lin Q10432968_MName = mkMName "Boo landsmunicipality" ; 
lin Q10678557_MName = mkMName "Stenkumla landsmunicipality" ; 
-- #END INSERT# --

}