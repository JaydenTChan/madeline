/*
Chapter 1, Part 1

Initialize State(s)
Use this script to initialize any variables that are relevant to this chapter/part.

Summary: Finding out basic controls
*/

audio_sound_gain(global.snd, 0, 5000);

if (global.cont == 1){
    if(global.part = 2){
        switchToPart(STAMPart2Obj);
    }
}

if (global.cont == 0){
    //Skip if continue so the game state from the loaded game remains intact.
    global.chapter = 2; //Change these to the relevant part/chapter
    global.part = 1;
    global.state = 0;
    
    //Introductory text for this chapter.
    ds_list_add(global.log, "You are in your room.");
    ds_list_add(global.log, "A light from across the street peers through the window - the neighbours might still be awake.");

}



