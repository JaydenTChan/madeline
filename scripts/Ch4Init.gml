/*
Chapter 3, Part 1

Initialize State(s)
Use this script to initialize any variables that are relevant to this chapter/part.

Summary: Finding out basic controls
*/

audio_sound_gain(global.snd, 0, 5000);

if (global.cont == 0){
    //Skip if continue so the game state from the loaded game remains intact.
    global.chapter = 4; //Change these to the relevant part/chapter
    global.part = 1;
    global.state = 0;
    
    //Introductory text for this chapter.
    msg( "You softly close the door behind you. Your jacket reeks of smoke. You take it off and place it on the rack. ");
    msg( "As you are walking to your room, you hear a voice coming from the [c=255]kitchen[/c].");
    msg( "“Michael. I need you to come here for a minute.”");

}



