concrete BoroughsEng of Boroughs = FactsEng, BoroughNamesEng - [LocName], MuniNamesEng - [LocName] ** 

open SyntaxEng, ParadigmsEng, SymbolicEng, (I=IrregEng), Prelude, Predef, (E=ExtendEng), ExtraEng, MarkupEng, ConjunctionEng  in {

    lincat Area = Str ;
    lincat Location = N ;
    lincat Occupation = NP ;
    lincat OccupationList = ListNP ;
    lincat ListItem = NP ;
    lincat HtmlList = ListNP ;
    lincat Direction = Adv ;
    lincat FamousPerson = PN ;
    lincat Time = NP ; 
    lincat Event = NP ; 
    lincat Title = Cl ;
    lincat Test = CN ;
     

    lin 

        testCN = mkCN (mkN "test"); 

        testCnList a b c = (lin Cl (ConjCN and_Conj (ConsCN a (BaseCN b c)))) ;

        mkPersonName str = {np = symb (mkSymb str.s); pron = he_Pron} ;

        Sweden_Name = {np = (mkNP (mkPN "Sweden")) ; pron = it_Pron} ;

        bName name = {np = name.np ; pron = npPron name.np} ;
        mName name = {np = name.np ; pron = npPron name.np} ;

        stringValue s = (symb s.s) ; 

        population_Attribute = mkAttribute "population";
        area_Attribute = mkAttribute "area";

        location_south = mkLocation "south";
        location_central = mkLocation "middle";
        location_north = mkLocation "north";
        
        
        mkOccupation str = (symb str.s) ; 
        mkOccupationList occ1 occ2 = mkListNP occ1 occ2 ; 
        addOccupation occ occList = mkListNP occ occList ; 

        mkListItem str = symb (mkSymb str.s) ;
        mkHtmlList i1 i2 = mkListNP (MarkupNP li_Mark i1) (MarkupNP li_Mark i2) ;
        addHtmlList i l = mkListNP (MarkupNP li_Mark i) l ;
        wrapWithUl list = mkCl (MarkupNP ul_Mark (mkNP and_Conj list)) ;
        singleItemHtmlList item = mkCl (MarkupNP ul_Mark (MarkupNP li_Mark item)) ;
        
        --The temperature of *borough* is *Temp*
        weatherFact temp bname = mkCl (mkNP the_Det (mkCN (mkN2 (mkN "temperature") in_Prep) bname.np )) (lin Adv temp) ;

        StringName str = {np = (symb (mkSymb str.s)); pron = they_Pron} ;

        testFact occ = mkCl occ ; 

        --In *year* the event *event* occured in *borough*
        eventFact time event bname = mkCl (SyntaxEng.mkAdv in_Prep time) (mkS (mkCl event (mkV2 "occured" in_Prep) bname.np) ) ;

        -- malmö lies in the south of sweden
        locationFact bname location = mkCl bname.np (mkV2 "lie" in_Prep) (mkNP the_Det (mkCN (mkN2 location part_Prep) Sweden_Name.np ) ) ; 
        
        --Change mname.np to mkNp of listNp...
        locationFact2 bname location mname = mkCl bname.np (mkV2 "lie" in_Prep) (mkNP mname.np (mkRS (mkRCl ExtraEng.which_RP (mkV2 "lie" in_Prep) (mkNP the_Det (mkCN (mkN2 location part_Prep) Sweden_Name.np ))))) ; 

        --PERSON is a OCCUPATION from CITY
        --famousPersonFrom person occupation bname = mkCl (mkNP (mkN person.s)) (mkV2 (mkV "comes") from_Prep) bname.np ;

        --this one is for persons with multiple occupations
        famousPersonFrom1 person occupation bname = mkCl (symb person) (mkNP (mkNP and_Conj occupation) (SyntaxEng.mkAdv from_Prep bname.np)) ;

        --this one is for persons with one occupation
        famousPersonFrom0 person occupation bname = mkCl (symb person) (mkNP occupation (SyntaxEng.mkAdv from_Prep bname.np)) ;


        municipalityFact bname mname = mkCl bname.np (mkV2 "lie" in_Prep) mname.np ; 

        -- (mkListNP mname.np )
        municipalityFact2 bname mname1 mname2        = mkCl bname.np (mkV2 "lie" in_Prep) (mkNP and_Conj (mkListNP mname1.np mname2.np)) ; 
        municipalityFact3 bname mname1 mname2 mname3 = mkCl bname.np (mkV2 "lie" in_Prep) (mkNP and_Conj (mkListNP mname1.np ( mkListNP mname2.np mname3.np ))) ;
        municipalityFactMore bname Int = mkCl bname.np (mkV2 "lie" in_Prep) (mkNP <symb Int : Card> (mkN "municipality")) ;


        --relativeToCityFact dist dir city = mkCl (mkNP the_Det (mkN "locality")) (mkVP (mkVP (mkV2 I.lie_V part_Prep) city.np) (ParadigmsEng.mkAdV (dist.s++dir.s)) )  ;
        relativeToCityFact dist dir city = mkCl (mkNP the_Det (mkN "locality")) (mkVP (mkVP I.lie_V) (SyntaxEng.mkAdv (mkAdA (dist.s ++ dir.s)) (SyntaxEng.mkAdv part_Prep city.np) ));
        titleEvents = mkCl (MarkupNP h2_Mark (mkNP (mkN "Event"))) ;
        title2fact title = title ;

        --unitSquareM int = E.CardCNCard <symb int : Card> (mkN "square mile") ;
        --unitHectare int  = E.CardCNCard <symb int : Card> (mkN "hectare") ;
        --unitSquarekm int = E.CardCNCard <symb int : Card> (mkN "square kilometer") ;

        unitHectare str  =  (symb (str.s ++ "hectare")) ;
        unitSquareM str  =  (symb (str.s ++ "square miles")) ;
        unitSquarekm str  =  (symb (str.s ++ "square kilometers")) ;
        


        dirN = mkDir "north";
        dirNE = mkDir "north east";
        dirE = mkDir "east" ;
        dirSE = mkDir "south east" ;
        dirS = mkDir "south";
        dirSW = mkDir "south west" ;
        dirW = mkDir "west" ;
        dirNW = mkDir "north west" ;


    -- oper mkLISTNP : Str -> ListNP = \s -> s

    -- oper hectareToSqMiles : Int -> Float = \n -> n*0.003861022 ; Fel

    

    oper mkDir : Str -> Adv = \s -> mkAdv s ;

    oper mkLocation : Str -> CN = \s -> mkCN (mkN s) ;

    oper Area_N : N = mkN "area" "areas";

    oper
        mkAttribute : Str -> CN = \s -> mkCN (mkN s) ; 
    

    oper 
        myMkCard : Str -> Card = \s -> symb (mkSymb s) ;

    locPrep : LocName -> Prep = \name -> case name.isIn of {
        True => in_Prep ;
        False => on_Prep 
    } ;
}
