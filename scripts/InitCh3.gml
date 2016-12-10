/*
Chapter 3, Part 1

Initialize State(s)
Use this script to initialize any variables that are relevant to this chapter/part.

Summary: Finding out basic controls
*/

audio_sound_gain(global.snd, 0, 5000);

if (global.cont == 0){
    //Skip if continue so the game state from the loaded game remains intact.
    global.chapter = 3; //Change these to the relevant part/chapter
    global.part = 1;
    global.state = 1;
    
    //Introductory text for this chapter.
    msg( "As you pass the kitchen you hear your mom humming to herself.");
    msg( "You stop, and head into the kitchen.");
    msg( "You see your mom flipping through a cookbook.");
    msg( "It seems she didn't notice you coming in.");
    msg( "You should probably greet her or you can head back to your room.");

}



