/*
Chapter 1, Part 2

Initialize State(s)
Use this script to initialize any variables that are relevant to this chapter/part.

Summary: Finding out basic controls
*/
if (global.cont == 0){
    //Skip if continue so the game state from the loaded game remains intact.
    global.chapter = 1; //Change these to the relevant part/chapter
    global.part = 2;
    global.state = 0;
    
    //Introductory text for this chapter.
    ds_list_add(global.log, "You enter the kitchen, your mom smiles sweetly at you.");
    ds_list_add(global.log, chr(34) + "Good morning Michael, here's breakfast." + chr(34));
    ds_list_add(global.log, "Your mom hands you a plate with two eggs and some toast.");
}

