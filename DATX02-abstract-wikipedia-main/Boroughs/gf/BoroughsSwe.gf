concrete BoroughsSwe of Boroughs = FactsSwe, BoroughNamesSwe - [LocName], MuniNamesSwe - [LocName] ** 

open SyntaxSwe, ParadigmsSwe, SymbolicSwe, (I=IrregSwe), Prelude, Predef, (E=ExtendSwe), MarkupSwe in {

    lincat Area = Str ;
    lincat Location = N ;
    lincat Occupation = NP ;
    lincat OccupationList = ListNP ;
    lincat ListItem = NP ;
    lincat HtmlList = ListNP ;
    lincat Direction = Adv ;
    lincat Title = Cl ;


    lin 
        Sweden_Name = {np = (mkNP (mkPN "Sverige")) ; pron = it_Pron} ;

        bName name = {np = name.np ; pron = npPron name.np} ;
        mName name = {np = name.np ; pron = npPron name.np} ;

        --Enbart test, remove before delivery --------------------------
        TestOcc = mkNP a_Det (mkN "snickare" "snickare") ;
        TestOcc2 = mkNP a_Det (mkN "målare" "målare") ;
        TestOcc3 = mkNP a_Det (mkN "ingenjör") ;
        TestP1 = {np = mkNP ( mkPN "William Nilsson"); pron = he_Pron}  ;

        TestItem1 = mkNP (mkN "event1") ;
        TestItem2 = mkNP (mkN "event2") ;
        TestItem3 = mkNP (mkN "event3") ;

        -- -------------------------------------------------------------
        stringValue s = (symb s.s) ; 


        population_Attribute = mkAttribute "befolkning" ; 
        area_Attribute = mkAttribute "yta";

        location_south = mkLocation "södra";
        location_central = mkLocation "centrala";
        location_north = mkLocation "norra";
        
        locationFact bname location = mkCl bname.np (mkV2 "ligger" in_Prep) (mkNP (mkCN location Sweden_Name.np ) ) ; 
        locationFact2 bname location mname = mkCl bname.np (mkV2 "ligger" in_Prep) (mkNP mname.np (mkRS (mkRCl which_RP (mkV2 "ligger" in_Prep) (mkNP (mkCN location Sweden_Name.np ))))) ;

        mkOccupation str = symb (mkSymb str.s) ; 
        mkOccupationList occ1 occ2 = mkListNP occ1 occ2 ; 
        addOccupation occ occList = mkListNP occ occList ;

        mkListItem str = symb (mkSymb str.s) ;
        mkHtmlList i1 i2 = mkListNP (MarkupNP li_Mark i1) (MarkupNP li_Mark i2) ;
        addHtmlList i l = mkListNP (MarkupNP li_Mark i) l ;
        wrapWithUl list = mkCl (MarkupNP ul_Mark (mkNP and_Conj list)) ;
        singleItemHtmlList item = mkCl (MarkupNP ul_Mark (MarkupNP li_Mark item)) ;

        --Lerums temperatur är *temp*
        weatherFact temp bname = mkCl (mkNP (E.GenNP bname.np) (mkCN (mkN "temperatur"))) (lin Adv temp) ;
        --weatherFact temp bname = mkCl (mkNP (mkNP the_Det (mkN "temperatur")) (mkAdv in_Prep bname.np)) (lin Adv temp) ;

        --this one is for persons with multiple occupations
        famousPersonFrom1 person occupation bname = mkCl (symb person) (mkNP (mkNP and_Conj occupation) (SyntaxSwe.mkAdv from_Prep bname.np)) ;

        --this one is for persons with one occupation
        famousPersonFrom0 person occupation bname = mkCl (symb person) (mkNP occupation (SyntaxSwe.mkAdv from_Prep bname.np)) ;

        municipalityFact bname mname                 = mkCl bname.np (mkV2 "ligger" in_Prep) mname.np ; 
        municipalityFact2 bname mname1 mname2        = mkCl bname.np (mkV2 "ligger" in_Prep) (mkNP and_Conj (mkListNP mname1.np mname2.np)) ; 
        municipalityFact3 bname mname1 mname2 mname3 = mkCl bname.np (mkV2 "ligger" in_Prep) (mkNP and_Conj (mkListNP mname1.np ( mkListNP mname2.np mname3.np ))) ;
        municipalityFactMore bname Int               = mkCl bname.np (mkV2 "ligger" in_Prep) (mkNP <symb Int : Card> (mkN "kommun" "kommuner")) ;

        -- "Tätorten ligger 20 km öster om Göteborg."
        -- relativeToCityFact dist dir city = mkCl (mkNP the_Det (mkN "tätort")) (mkV3 I.ligga_V (mkPrep "om")) (mkNP dir) city.np ;
        relativeToCityFact dist dir city = mkCl (mkNP the_Det (mkN "Tätort")) (mkVP  (SyntaxSwe.mkAdv (mkAdA dist.s) dir) (mkVP (mkV2 I.ligga_V (mkPrep "om")) city.np) )  ;


        titleEvents = mkCl (MarkupNP h2_Mark (mkNP (mkN "Event"))) ;
        title2fact title = title ;

        --unitHectare int  = E.CardCNCard <symb int : Card> (mkCN (mkN "hektar" "hektar")) ;
        --unitSquarekm int  = E.CardCNCard <symb int : Card> (mkCN (mkN "kvadratkilometer" "kvadratkilometer")) ; 
        --unitSquareM int  = E.CardCNCard <symb int : Card> (mkCN (mkN "kvadratmiles" "kvadratmiles")) ;

        unitHectare str  =  (symb (str.s ++ "hektar")) ;
        unitSquarekm str  =  (symb (str.s ++ "kvadratkilometer")) ;
        unitSquareM str  =  (symb (str.s ++ "square miles")) ;


        dirN = mkDir "norr";
        dirNE = mkDir "nordost";
        dirE = mkDir "öster" ;
        dirSE = mkDir "sydost";
        dirS = mkDir "söder";
        dirSW = mkDir "sydväst" ;
        dirW = mkDir "väster" ;
        dirNW = mkDir "nordväst" ;
        
    oper mkDir : Str -> Adv = \s -> mkAdv s ;
    oper mkLocation : Str -> N = \s -> mkN s ;

    oper Area_N : N = mkN "area" "areor";
    oper Km2_N : N = mkN "kvadratmeter";

    oper
        mkAttribute : Str -> CN = \s -> mkCN (mkN s) ; 
    
    oper 
        myMkCard : Str -> Card = \s -> symb (mkSymb s) ;

    locPrep : LocName -> Prep = \name -> case name.isIn of {
        True => in_Prep ;
        False => on_Prep 
    } ;
}
