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
3 = INPUT 6

*/

LA = string_lower(global.lastAction);
door = false;       //DOOR INPUT 1
founddoor = false;  //FOUND DOOR INPUT 2
climb = false;      //CLIMB INPUT 5
question = false;   //QUESTION ABOUT NOT GOOD PEOPLE INPUT 8(1)
fort = false;       //GO TO FORT 9(1)
enableneighbor = false; //ENABLE TO GO TO NEIGHBOUR 9(2)
switch(global.state){
    case 0: //INPUT 1
        if(LA == "look around"||LA == "look"){
            ds_list_add(global.log, "You can't see much in the darkness.");
            ds_list_add(global.log, "There is a slight sliver of light coming from the winodw across the room.");
            ds_list_add(global.log, "The door to your room is closed.");
        }else if(LA == "go to window" || LA == "go window"||LA == "check window"){
            ds_list_add(global.log, "The window it too high up for you to do anything.");
        }else if(LA == "scream for help"||LA=="cry for help"||LA=="ask for help"){
            ds_list_add(global.log, "You hear footsteps quicken.");
        }else if(LA=="wave for help"){
            ds_list_add(global.log, "No one can see you wave");
        }else if(LA=="open door"||LA =="open the door"){
            ds_list_add(global.log, "You open the door.");
            ds_list_add(global.log, "Outside there is a dark outline of a hallway");
            door = true;
        }else if(door&&(LA=="leave room"||LA=="go to hallway"||LA=="go hallway")){
            ds_list_add(global.log, "You walk out into the dark hallway.");
            ds_list_add(global.log, "You are now at one end of the hallway, but it is too dark to see.");
            global.needsHelp = 0;
            global.state = 1;
        }else {
            global.needsHelp += 1;
            if(global.needsHelp == 5){
                ds_list_add(global.log, "I can open the door");
            }
        }
        break;
    case 1: //INPUT 2
        if(LA == "look around"||LA == "look"){
            ds_list_add(global.log, "You can't see much in the darkness.");
        }else if(LA == "turn on light" || LA == "flip the switch"||LA == "flip light"){
            ds_list_add(global.log, "The hallway is now lit.");
            ds_list_add(global.log, "You see the entrance to Madeline’s room is slightly ajar.");
            founddoor = true;
        }else if(LA == "go forward"||LA=="go straight"||LA=="walk forward"||LA=="walk straight"){
            ds_list_add(global.log, "You slowly feel your way through the dark until your hand touches a door that has been left slightly ajar.");
            founddoor = true;
        }else if(founddoor &&(LA== "open door"||LA== "go door"||LA=="go Madeline's room"||LA=="go room"||LA=="go to Madeline's room"||LA=="go to room"||LA=="enter room"||LA=="enter Madeline's room")){
            ds_list_add(global.log, "You enter Madeline’s room.");
            ds_list_add(global.log, "You see that the window is open at the other end of room.");
            global.needsHelp = 0;
            global.state = 2;
        }else {
            global.needsHelp += 1;
            if(global.needsHelp == 5){
                if(founddoor){
                    ds_list_add(global.log, "I wonder what is inside the room");
                } else {
                    ds_list_add(global.log, "You could walk to the other end of the hallway or turn on the light.");
                } 
            }
        }
        break;
    case 2: //INPUT 5
        if(LA == "look around"||LA == "look"){
            ds_list_add(global.log, "It is too dark to see anything.");
        }else if(LA == "go to window" || LA == "go window"||LA == "check window"){
            ds_list_add(global.log, "You walk up to the window.");
            ds_list_add(global.log, "The window is still out of reach, but I think I can climb the nearby drawer.");
            climb = true;
        }else if(climb &&(LA== "climb drawer"||LA=="climb")){
            ds_list_add(global.log, "As you are exiting the window, you hear a sound coming from behind you.");
            ds_list_add(global.log, "“Mikey - why are you in my window?”");
            ds_list_add(global.log, "”Are you going somewhere?”");
            ds_list_add(global.log, "You can’t just leave her here...");
            global.needsHelp = 0;
            global.state = 3;
        }else {
            global.needsHelp += 1;
            if(global.needsHelp == 5){
                ds_list_add(global.log, "I wonder if I can find out where the light from the window is coming from.");
            }
        }
        break;
    case 3: //INPUT 6
        if(LA == "look around"||LA == "look"){
            ds_list_add(global.log, "The voice came from Madeline.");
        }else if(LA == "leave her" || LA == "leave Madeline"){
            //Does nothing so far? there no 7(2) written
        }else if(LA== "take her"||LA=="take Madeline"){
            ds_list_add(global.log, "You and Madeline escape out the window.");
            ds_list_add(global.log, "You are now in your backyard.");
            ds_list_add(global.log, "The light of the house next door is on and you can see that they are awake in their living room.");
            //JUMP TO THE NEXT CASE
        }else {
            global.needsHelp += 1;
            if(global.needsHelp == 5){
                ds_list_add(global.log, "Do I take her with me or leave her?");
            }
        }
        break;
    case 4: //INPUT 7
        if(LA == "look around"||LA == "look"){
            ds_list_add(global.log, "It is the middle of the night.");
            ds_list_add(global.log, "The only thing you can see is the neighbour’s house.");
        }else if(LA == "go neightbour's house" || LA == "go to neightbour's house"){
            if(question){
                //GO to 9(2)
            } else {
                ds_list_add(global.log, "You’re moving towards your neighbours house when you feel a sharp tug on your shirt.");
                ds_list_add(global.log, "“We can’t go there Mikey.”");
                //"good people" is suppose to be in red
                ds_list_add(global.log, "They’re not good people.");
                question = true;
            }  
        }else if(question&&(LA== "ask not good people"||LA=="ask about not good people")){
            ds_list_add(global.log, "“They told us that we weren’t their problem.“");
            ds_list_add(global.log, "“Can we go to the fort?”");
            fort = true;
            enableneighbor = true;
        
        }else if (fort&&(LA== "go to fort"||LA=="go fort")){
            //GO to fort case 
        }else {
            global.needsHelp += 1;
            if(global.needsHelp == 5 ){
                if(!fort){
                    ds_list_add(global.log, "Maybe I should head towards the neighbour's house");
                } else {
                    ds_list_add(global.log, "Do I go to the fort or the neighbour's house?");
                }
            }
        }
        break;
}


