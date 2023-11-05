concrete BoroughsGer of Boroughs = FactsGer, BoroughNamesGer - [LocName], MuniNamesGer - [LocName] ** 

open SyntaxGer, ParadigmsGer, SymbolicGer, (I=IrregGer), Prelude, (E=ExtendGer), MarkupGer in {

    lincat Area = Str ;
    lincat Location = N ;
    lincat Occupation = NP ;
    lincat OccupationList = ListNP ;
    lincat ListItem = NP ;
    lincat HtmlList = ListNP ;
    lincat Direction = Adv ;
    lincat Title = Cl ;
    lincat FamousPerson = PN;


    lin 

        Sweden_Name = {np = (mkNP (mkPN "Schweden")) ; pron = it_Pron} ;
        bName name = name **{pron = npPron name.np} ;
        mName name = name **{pron = npPron name.np} ;
        
        stringValue s = (symb s.s) ; 

        mkOccupation str = symb (mkSymb str.s) ; 
        mkOccupationList occ1 occ2 = mkListNP occ1 occ2 ; 
        addOccupation occ occList = mkListNP occ occList ; 
        
        mkListItem str = symb (mkSymb str.s) ;
        mkHtmlList i1 i2 = mkListNP (MarkupNP li_Mark i1) (MarkupNP li_Mark i2) ;
        addHtmlList i l = mkListNP (MarkupNP li_Mark i) l ;
        wrapWithUl list = mkCl (MarkupNP ul_Mark (mkNP and_Conj list)) ;
        singleItemHtmlList item = mkCl (MarkupNP ul_Mark (MarkupNP li_Mark item)) ;

        population_Attribute = mkAttribute (mkN "Einwohnerzahl" feminine);
        area_Attribute = mkAttribute (mkN "Bereich" masculine);
        
        location_south = mkLocation "Süden";
        location_central = mkLocation "Mitten";
        location_north = mkLocation "Norden";
         

        locationFact bname location = mkCl bname.np (mkV2 I.liegen_V in_Prep) (mkNP the_Det (mkCN (mkN2 location part_Prep) Sweden_Name.np ) ) ; 
        locationFact2 bname location mname = mkCl bname.np (mkV2 I.liegen_V in_Prep) (mkNP mname.np (mkRS (mkRCl which_RP (mkV2 (mkV "liegen") in_Prep) (mkNP the_Det (mkCN (mkN2 location part_Prep) Sweden_Name.np ))))) ;

        weatherFact temp bname = mkCl (mkNP the_Det (mkN "Temperatur" feminine)) (lin Adv temp) ;


        --this one is for persons with multiple occupations
        famousPersonFrom1 person occupation bname = mkCl (symb person) (mkNP (mkNP and_Conj occupation) (SyntaxGer.mkAdv from_Prep bname.np)) ;

        --this one is for persons with one occupation
        famousPersonFrom0 person occupation bname = mkCl (symb person) (mkNP occupation (SyntaxGer.mkAdv from_Prep bname.np)) ;

        municipalityFact bname mname = mkCl bname.np (mkV2 I.liegen_V in_Prep) mname.np ;                 
        municipalityFact2 bname mname1 mname2        = mkCl bname.np (mkV2 I.liegen_V in_Prep) (mkNP and_Conj (mkListNP mname1.np mname2.np)) ; 
        municipalityFact3 bname mname1 mname2 mname3 = mkCl bname.np (mkV2 I.liegen_V in_Prep) (mkNP and_Conj (mkListNP mname1.np ( mkListNP mname2.np mname3.np ))) ;
        municipalityFactMore bname Int = mkCl bname.np (mkV2 I.liegen_V in_Prep) (mkNP <symb Int : Card> (mkN "Gemeinde" feminine)) ;

        titleEvents = mkCl (MarkupNP h2_Mark (mkNP (mkN "Event"))) ;
        title2fact title = title ;
        
        unitHectare str  =  (symb (str.s ++ "hectare")) ;
        unitSquareM str  =  (symb (str.s ++ "miles")) ;
        unitSquarekm str  =  (symb (str.s ++ "Quadratkilometer")) ;


        dirN = mkDir "Norden";
        dirNE = mkDir "Nordost";
        dirE = mkDir "Ost" ;
        dirSE = mkDir "Südost" ;
        dirS = mkDir "Süden";
        dirSW = mkDir "Südwesten" ;
        dirW = mkDir "Westen" ;
        dirNW = mkDir "Nordwest" ;

        relativeToCityFact dist dir city = mkCl (mkNP the_Det (mkN "Gemeinde" feminine)) (mkVP  (mkVP I.liegen_V) (SyntaxGer.mkAdv (lin AdA {s = (dist.s ++ dir.s)}) (SyntaxGer.mkAdv part_Prep city.np) ));


    oper mkDir : Str -> Adv = \s -> ParadigmsGer.mkAdv s ;
    oper mkLocation : Str -> N = \s -> mkN s ;

    oper
        mkAttribute : N -> CN = \n -> mkCN n ; 
    
}
