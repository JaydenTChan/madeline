/*
Chapter 1, Part 1

Generic commands for consistency:
leave room/exit room
look around
enter <roomname>/go to <roomname>       //Note: <roomname> should match how it is in the "look around" command.
get <item>/pick up <item>/take <item>   //Note: similar to above <item> should match the "look around" command.

Notes:
global.needsHelp should be reset everytime the player does something to change the game state.
it may be helpful to keep a list of states on a separate window (like copying them all to notepad).
use ds_list_add(global.inventory, "<name>"); to keep track of inventory items. these get saved into the save file
use ds_list_add(global.evidence, "<name>"); to keep track of evidencee items. these get saved into the save file
use ds_list_add(global.actions, "<name>"); to keep track of actions the player takes. these get saved into the save file
For an example of "actions" look at the shower (case4)

Use ds_list_find_index(<listname>, "<name>"); If it exists it'll return the index, but if it does not it'll return -1.

DS LIST DOCUMENTATION: https://docs.yoyogames.com/source/dadiospice/002_reference/data%20structures/ds%20lists/index.html

I imported a script which lets us use tags for coloured text.
Use the tags as such:
[c=255] Red Text [/c]                   //Only for red text where 255 is the brightness of Red
[c="+string($FF0000)+"] Blue Text [/c]  //I'm not sure why but the guy who wrote the script reversed rgb into bgr so remember that.

You can use chr(34) to write quotations. Eg. ch(34) + "Hi!" + chr(34)

Try to think of at least 1 other permutation for any command so that the game can pick up commands better.

Define states here. These are for our use.
For example we may use state = 0 as a way to tell the game that the player has not yet left their room.
We may also determine their inventory.

Also take note of what each state means in a comment.

States:
0 = INPUT 1
1 = INPUT 2
2 = INPUT 5 (INPUT 3 AND 4 CAN BE FUSED TOGETHER)
3 = INPUT 6/7
4 = INPUT 8

*/

LA = string_lower(global.lastAction);

switch(global.state){
    case 0: //INPUT 1
        if(LA == "look around"||LA == "look"){
            msg( "You can't see much in the darkness.");
            msg( "There is a slight sliver of light coming from the window across the room.");
            msg( "The door to your room is closed.");
        }else if(LA == "go to window" || LA == "go window"||LA == "check window"){
            msg( "The window it too high up for you to do anything.");
        }else if(LA == "scream for help"||LA=="cry for help"||LA=="ask for help"){
            msg( "You hear footsteps quicken.");
        }else if(LA=="wave for help"){
            msg( "No one can see you wave");
        }else if(checkAction("door") == false && LA=="open door"||LA =="open the door"){
            msg( "You open the door.");
            msg( "Outside there is a dark outline of a hallway");
            addAction("door");
        }else if(checkAction("door") == true &&(LA == "close door" || LA == "close the door")) {
            msg( "You close the open door.");
            msg( "A sense of relief washes over you. Then a chill runs down your spine, you hear the footsteps.");
            removeAction("door");
        }else if(checkAction("door") == true &&(LA=="leave room"||LA=="go to hallway"||LA=="go hallway")){
            msg( "You walk out into the dark hallway.");
            msg( "You are now at one end of the hallway, but it is too dark to see.");
            global.needsHelp = 0;
            global.state = 1;
        }else {
            global.needsHelp += 1;
            msg( "I don't understand your command");
            if(global.needsHelp == 5){
                msg( "I can open the door");
            }
        }
        break;
    case 1: //INPUT 2
        if(LA == "look around"||LA == "look"){
            msg( "You can't see much in the darkness.");
        }else if(checkAction("foundDoor") == false &&(LA == "turn on light" || LA == "flip the switch"||LA == "flip light")){
            msg( "The hallway is now lit.");
            msg( "You see the entrance to Madeline’s room is slightly ajar.");
            addAction("foundDoor");
        }else if(checkAction("foundDoor") == false &&(LA == "go forward"||LA=="go straight"||LA=="walk forward"||LA=="walk straight")){
            msg( "You slowly feel your way through the dark until your hand touches a door that has been left slightly ajar.");
            ds_list_add(global.actions, "foundDoor");
        }else if(checkAction("foundDoor") == true &&(LA== "open door"||LA== "go door"||LA=="go Madeline's room"||LA=="go room"||LA=="go to Madeline's room"||LA=="go to room"||LA=="enter room"||LA=="enter Madeline's room")){
            msg( "You enter Madeline’s room.");
            msg( "You see that the window is open at the other end of room.");
            global.needsHelp = 0;
            global.state = 2;
        }else {
            global.needsHelp += 1;
            msg( "I don't understand your command");
            if(global.needsHelp == 5){
                if(checkAction ("foundDoor") == true){
                    msg( "I wonder what is inside the room");
                } else {
                    msg( "You could walk to the other end of the hallway or turn on the light.");
                } 
            }
        }
        break;
    case 2: //INPUT 5
        if(LA == "look around"||LA == "look"){
            msg( "It is too dark to see anything.");
        }else if(LA == "go to window" || LA == "go window"||LA == "check window"){
            msg( "You walk up to the window.");
            msg( "The window is still out of reach, but I think I can climb the nearby drawer.");
            addAction("climb");
        }else if(checkAction("climb") == true &&(LA== "climb drawer"||LA=="climb")){
            msg( "As you are exiting the window, you hear a sound coming from behind you.");
            msg( "“Mikey - why are you in my window?”");
            msg( "”Are you going somewhere?”");
            msg( "You can’t just leave her here...");
            global.needsHelp = 0;
            global.state = 3;
        }else {
            global.needsHelp += 1;
            msg( "I don't understand your command");
            if(global.needsHelp == 5){
                msg( "I wonder if I can find out where the light from the window is coming from.");
            }
        }
        break;
    case 3: //INPUT 6
        if(LA == "look around"||LA == "look"){
            msg( "The voice came from Madeline.");
        }else if(LA== "take her"||LA=="take Madeline"){
            msg( "You and Madeline escape out the window.");
            msg( "You are now in your backyard.");
            msg( "The light of the house next door is on and you can see that they are awake in their living room.");
            global.needsHelp = 0;
            switchToPart(STAMPart2Obj);
        } else if(LA == "leave her" || LA == "leave Madeline" || LA == "leave madeline" ){
            msg( "You leave, Madeline follows you. You look to protest but she puts up her best puppy eyes.");
            msg( "You are left with no choice, you take her with you.");
            global.needsHelp = 0;
            switchToPart(STAMPart2Obj);
        }else {
            global.needsHelp += 1;
            msg( "I don't understand your command");
            if(global.needsHelp == 5){
                msg( "Do I take her with me or leave her?");
            }
        }
        break;
        
    /** Jayden
    Summary Panel: You obtained “Fearful”
    Fearful - Your sister has disclosed to you that someone is trying to hurt her. +2 Mom & Dad
    **/

}


