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
    global.chapter = 1; //Change these to the relevant part/chapter
    global.part = 1;
    global.state = 0;
    
    //Introductory text for this chapter.
    ds_list_add(global.log, "[c="+string($00FFFF)+"]This is your message log.[/c]");
    ds_list_add(global.log, "[c="+string($00FFFF)+"]You may use the arrow keys or mouse to scroll.[/c]");

    ds_list_add(global.log, "You awaken in your room. The sun shines brightly.");
    ds_list_add(global.log, "The sunlight filters through the curtains blinding you.");
    ds_list_add(global.log, "You're lying down in bed.");
}



