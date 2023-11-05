abstract Boroughs = Facts, BoroughNames, MuniNames, OccupationNames ** {

    --flags startcat = Doc ;

    cat Area ;
    cat Location ;
    cat Occupation ;
    cat OccupationList ;
    cat ListItem ;
    cat HtmlList ;
    cat Time ; 
    cat Event ;
    cat Direction ;
    cat Title ;
    cat FamousPerson ;


    fun 
        TestOcc : Occupation ;
        TestOcc2 : Occupation ;
        TestOcc3 : Occupation ;
        TestItem1 : ListItem ;
        TestItem2 : ListItem ;
        TestItem3 : ListItem ;
        TestP1 : Name ;
        TestP2 : Name ;
        mkPersonName : String -> Name ; 


        Sweden_Name : Name ;

        bName : BName -> Name ;
        mName : MName -> Name ;
        oName : OName -> Name ; 

        location_south : Location ;
        location_north : Location ;
        location_central : Location ;

        population_Attribute : Attribute ;
        area_Attribute : Attribute ;

        stringValue : String -> Value ;

        mkOccupation : String -> Occupation ; 
        mkOccupationList : Occupation -> Occupation -> OccupationList ;
        addOccupation : Occupation -> OccupationList -> OccupationList ; 

        mkListItem : String -> ListItem ;
        mkHtmlList : ListItem -> ListItem -> HtmlList ;
        addHtmlList : ListItem -> HtmlList -> HtmlList ;
        wrapWithUl : HtmlList -> Fact ;
        singleItemHtmlList : ListItem -> Fact ;

        StringName : String -> Name ;

        testFact : Occupation -> Fact ;

        eventFact : Time -> Event -> Name -> Fact;


        weatherFact : String -> Name -> Fact ;
 
        famousPersonFrom0 : String -> Occupation -> Name -> Fact ;
        famousPersonFrom1 : String -> OccupationList -> Name -> Fact ;

        --famousPersonFrom2 : Str -> Str -> Str -> Name -> Fact ;
        --famousPersonFrom3 : Str -> Str -> Str -> Str -> Name -> Fact ;
        --famousPersonFromMore : Str -> Str -> Str -> Str -> Name -> Fact ;
        locationFact : Object -> Location -> Fact ;
        locationFact2 : Name -> Location -> Name -> Fact;  
        municipalityFact : Object -> Object -> Fact ;
        municipalityFact2 : Object -> Object -> Object -> Fact ;
        municipalityFact3 : Object -> Object -> Object -> Object -> Fact ;
        municipalityFactMore : Object -> Int -> Fact ;

        relativeToCityFact : String -> Direction -> Name -> Fact ;

        titleEvents : Title ;
        title2fact : Title -> Fact ;

        --unitHectare: Int -> Numeric ;
        unitSquarekm : Int -> Value ;
        unitSquareM : Int -> Value ;
        
        unitHectare : String -> Value ; 

        dirN : Direction ;
        dirNE : Direction ;
        dirE : Direction ;
        dirSE : Direction ;
        dirS : Direction ;
        dirSW : Direction ;
        dirW : Direction ;
        dirNW : Direction ;
}