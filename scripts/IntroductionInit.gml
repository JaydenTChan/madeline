/*
Chapter 1, Part 1

Initialize State(s)
Use this script to initialize any variables that are relevant to this chapter/part.

Summary: Finding out basic controls
*/

if (global.cont == 0){
    //Skip if continue so the game state from the loaded game remains intact.
    global.chapter = 1; //Change these to the relevant part/chapter
    global.part = 1;
    global.state = 0;
    global.size = 1;
    
    //Introductory text for this chapter.\
    msg( "The object that has the most importance to you in the world.");
    msg( "Pick your favourite [c=255]childhood toy: [/c]");

}



