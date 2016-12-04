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
You can use chr(34) to write quotations. Eg. chr(34) + "Hi!" + chr(34)
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
        msg( "As you pass the kitchen you hear your mom humming to herself.");
        msg( "You stop, and head into the kitchen.");
        msg( "You see your mom flipping through a cookbook."));
        msg( "It seems she didn't notice you coming in.");
        msg( "You should probably greet her or you can head back to your room.");
        global.state = 1;
        break;
    case 1:
        if(LA == "look around"||LA == "look"){
            msg("You see your mom fiddling around with something as she hums a little melody.")
            msg("There are pots and pans scattered around the kitchen and spills that litter the floor.");
            msg("I guess somethings never change about mom.");
        }else if(LA == "talk to mom" || LA == "greet mom" || LA == "greet" || LA == "talk" || LA == "say hi" || LA == "say hi to mom" || LA == "talk mom"){
            msg( "She spins around and there is flour on her face.");
            msg( chr(34) + "There is my favourite little knight" + chr(34));
            msg( "She spreads her arms out and is looking for a hug.");
            global.state = 2;
            break;
        }else if(LA == "leave" || LA == "go to room" || LA == "go room" || LA == "leave room" || LA == "peace out" || LA == "leave" || LA == "leave kitchen"){
            msg("You duck out of the kitchen and head back to your room.");
            global.state = 3;
            break;
        }else {
            global.needsHelp += 1;
            msg( "I don't understand your command");
            if(global.needsHelp == 5){
                msg( "Should you leave or greet your mom?");
                global.needsHelp = 0;
            }
        }
    case 2:
        if(LA == "look around"||LA == "look"){
            msg("Your mom is looking for a big old hug from her favourite little knight.");
        }else if(LA == "hug her" || LA == "hug" || LA == "embrace her" || LA == "hug mom" || LA == "embrace mom"){
            msg( "As you run into her embrace, you hear");
            msg( chr(34) + "You have gotten too big to carry, but I can still give you a big old hug." + chr(34));
            msg( "You feel your vision cloud but quickly wipe it clear.");
            msg( "The words fumble out of your mouth");
            msg( chr(34) + "Come on ... mom ... I am a ... big boy now." + chr(34)); 
            global.state = 3;
            break;
        }else if(LA == "reject hug" || LA == "don't hug mom" || LA == "leave mom" || LA == "leave mom" || LA == "no hug" || LA == "reject" || LA == "no" || LA == "reject her hug"){
            msg("You turn away from you mom.");
            msg("As you leave the kitchen you notice your mom unphased with you leaving her mid-hug.");
            msg("She immediately resumes cooking as if you were never there to begin with.");
            global.state = 3;
            break;
        }else {
            global.needsHelp += 1;
            msg( "I don't understand your command");
            if(global.needsHelp == 5){
                msg( "You mom is looking for a hug.");
                msg( "You cna reject her hug or hug her");
                global.needsHelp = 0;
            }
        }
    case 3:
        msg("Giggling she says")l
        msg(chr(34) + "You will always be my little knight." + chr(34));
        msg("It has been a long time since you have seen your mom smile let alone laugh.");
        msg("She kneels down to your eye level.");
        msg(chr(34) + "Now Michael. Where is the little princess?" + chr(34));
        msg(chr(34) + "It is time for her and Mommy to take our magical pills" + chr(34));
        msg("It is happening again.");
        msg("Dad told me when she gets like this, I need to pretend with her. Until her pills wears off.");
        msg("You should tell her Madeline is sleeping or things can get bad Dad said.");
        global.state = 4;
        break;
    case 4:
        if(LA == "look around"||LA == "look"){
            msg("Your mom is expecting a answer from her favourite little knight.");
        }else if(LA == "tell her she is asleep" || LA == "she is sleeping" || LA == "sleep" || LA == "sleeping" || LA == "she's asleep" || LA == "Madeline asleep" || LA == "MAdeline is sleeping" || LA == "the princess is sleeping" || LA == "princess alseep" || LA == "she sleep" ){
            msg( "As you run into her embrace, you hear");
            msg( chr(34) + "You have gotten too big to carry, but I can still give you a big old hug." + chr(34));
            msg( "You feel your vision cloud but quickly wipe it clear.");
            msg( "The words fumble out of your mouth");
            msg( chr(34) + "Come on ... mom ... I am a ... big boy now." + chr(34)); 
            global.state = 3;
            break;
        }else if(LA == "reject hug" || LA == "don't hug mom" || LA == "leave mom" || LA == "leave mom" || LA == "no hug" || LA == "reject" || LA == "no" || LA == "reject her hug"){
            msg("You turn away from you mom.");
            msg("As you leave the kitchen you notice your mom unphased with you leaving her mid-hug.");
            msg("She immediately resumes cooking as if you were never there to begin with.");
            global.state = 3;
            break;
        }else {
            global.needsHelp += 1;
            msg( "I don't understand your command");
            if(global.needsHelp == 5){
                msg( "You mom is looking for a hug.");
                msg( "You cna reject her hug or hug her");
                global.needsHelp = 0;
            }
        }   
        
        /** JAYDEN senpai
         Summary Panel: 
         The “Mysterious Object” has been added to your inventory. (If you selected to “pocket it” in Input 2)
         (Mysterious Object: It’s covered in blood. 
         Fingerprints have faintly dried along the side of it. 
         I don’t know who they belong to.”) +2 (implicates everyone) to All
         
         This part is now done and move onto Ch2P1Intro
        **/
}
