/*
Chapter 1, Part 1

Initialize State(s)
Use this script to initialize any variables that are relevant to this chapter/part.

Summary: Finding out basic controls
*/
if (global.cont == 1){
    if(global.part = 2){
        switchToPart(chapter1Part2Obj);
    }
}
if (global.cont == 0){
    //Skip if continue so the game state from the loaded game remains intact.
    global.chapter = 2; //Change these to the relevant part/chapter
    global.part = 1;
    global.state = 0;
    
    //Introductory text for this chapter.
    ds_list_add(global.log, "You're sitting in your desk. Everyone around you looks bored.");
}

