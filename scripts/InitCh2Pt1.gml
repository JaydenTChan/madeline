/*
Chapter 1, Part 1

Initialize State(s)
Use this script to initialize any variables that are relevant to this chapter/part.

Summary: Finding out basic controls
*/

audio_stop_all(); //Stop all sounds from the introduction

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
    ds_list_add(global.log, "[c="+string($00FFFF)+"]This is your message log.[/c]");
    ds_list_add(global.log, "[c="+string($00FFFF)+"]You may use the arrow keys or mouse wheel to scroll.[/c]");
    ds_list_add(global.log, "[c="+string($00FFFF)+"]Use IMG to toggle off background images.[/c]");
    ds_list_add(global.log, "[c="+string($00FFFF)+"]Welcome to the demo! Basic commands are “open [obj], look around / look, ask about [specific event] ");
    ds_list_add(global.log, "/ ask [specific event (red text)] , go to [location] / go [location], leave room / leave, close [obj]”[/c]") 
    ds_list_add(global.log, "Enjoy!") 
    
    ds_list_add(global.log, "You are in your room.");
    ds_list_add(global.log, "A light from across the street peers through the window - the neighbours might still be awake.");

}



