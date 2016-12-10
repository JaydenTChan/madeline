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
            msg("You wonder if your mom will ever go back to normal. Like the good old days.");
            msg( "[c="+string($00FFFF)+"]Press Enter to Continue[/c]");
            global.state = 6;
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
            msg( "You feel your vision cloud but quickly wipe it clear. The words fumble out of your mouth");
            msg( chr(34) + "Come on ... mom ... I am a ... big boy now." + chr(34));
            msg("Giggling she says: " + chr(34) + "You will always be my little knight." + chr(34));
            msg("It has been a long time since you have seen your mom smile let alone laugh.");
            msg("She kneels down to your eye level.");
            msg(chr(34) + "Now Michael. Where is the little princess?" + chr(34));
            msg(chr(34) + "It is time for her and Mommy to take our magical pills" + chr(34));
            msg("It is happening again.");
            msg("Dad told me when she gets like this, I need to pretend with her. Until her pills wears off.");
            msg("You should tell her Madeline is sleeping or things can get bad Dad said.");
            msg("And never. Ever. Let mom go to Madeline's room.");
            global.state = 4;
            break;
        }else if(LA == "reject hug" || LA == "don't hug mom" || LA == "leave mom" || LA == "leave mom" || LA == "no hug" || LA == "reject" || LA == "no" || LA == "reject her hug"){
            msg("You turn away from you mom.");
            msg("As you leave the kitchen you notice your mom unphased with you leaving her mid-hug.");
            msg("She immediately resumes cooking as if you were never there to begin with.");
            msg("You wonder if your mom will ever go back to normal. Like the good old days.");
            msg( "[c="+string($00FFFF)+"]Press Enter to Continue[/c]");
            global.state = 6;
            break;
        }else {
            global.needsHelp += 1;
            msg( "I don't understand your command");
            if(global.needsHelp == 5){
                msg( "You mom is looking for a hug.");
                msg( "You can reject her hug or hug her");
                global.needsHelp = 0;
            }
        }
    case 3:
        msg("Useless easter egg you really can't get to");
        global.state = 4;
        break;
    case 4:
        if(LA == "look around"||LA == "look"){
            msg("Your mom is expecting an answer from her favourite little knight.");
        }else if(LA == "tell her she is asleep" || LA == "she is sleeping" || LA == "sleep" || LA == "sleeping" || LA == "she's asleep" || LA == "Madeline asleep" || LA == "MAdeline is sleeping" || LA == "the princess is sleeping" || LA == "princess alseep" || LA == "she sleep" ){
            msg( chr(34) + "But she hasn't take her magical pills with Mommy." + chr(34));
            msg( chr(34) + "Guard the kitchen my little knight, the Queen will be right back" + chr(34));
            msg( "I can't let mom go into her room.");
            msg( chr(34) + "Wait my queen" + chr(34));
            msg( "Your mom halts mid-way through the door, and turns to you.");
            msg( chr(34) + "This sounds like a quest for your brave little knight, and not for a Queen." + chr(34));
            msg( "Her face lights up with glee.");
            msg( chr(34) + "That is right! Here my little knight" + chr(34));
            msg( "She kneels down and hands you a little blue pill");
            msg( "Afterwards she leans closer and whispers in your ear");
            msg( chr(34) + "Once you get back, there will be a big red velvet cupcake waiting for you" + chr(34));
            msg( "You quickly head off out the kitchen.");
            msg( "As you turn around to say goodbye, your mom is already back to work at the stove.");
            msg( "You make your way to Madeline's room and turn on the lights.");
            msg( "Nothing has changed. Nothing ever changes in this room.");
            msg( "Better hide the pills somewhere mom won't find them");
            global.state = 5;
            break;
        }else if(LA == "leave room" || LA == "leave the room" || LA == "leave mom" || LA == "leave the kitchen" || LA == "go to your room" || LA == "go to room" || LA == "leave"){
            msg("As you leave the kitchen you notice your mom unphased with you leaving her in the middle of the conversation");
            msg("She immediately resumes cooking as if you were never there to begin with.");
            msg("You wonder if your mom will ever go back to normal. Like the good old days.");
            msg( "[c="+string($00FFFF)+"]Press Enter to Continue[/c]");
            global.state = 6;
            break;
        }else {
            global.needsHelp += 1;
            msg( "I don't understand your command");
            if(global.needsHelp == 5){
                msg( "Your mom is expecting an answer from her favourite little knight.");
                msg( "You can either leave room or answer her");
                msg("You should tell her Madeline is sleeping or things can get bad Dad said.");
                msg("And never. Ever. Let mom go to Madeline's room.");
                global.needsHelp = 0;
            }
        }   
    case 5:
        if(LA == "look around"||LA == "look"){
            msg("You are standing in Madeline's room.");
            msg("To your left is a big dresser, it would be a great place to hide the pills but");
            msg("Dad locked it up after mom kept trying to stuff them with more clothes.");
            msg("To your right is her bed. Still made and undisturbed. Might be hard hiding it there.");
            msg("The window on the other side of the room is locked shut. Been that way for a while now");
            msg("A drawer sits under the window, it has a visible layer of dust settled over it.");
            msg("This seems like a good place to hide the pills");
        }else if(LA == "hide the pills" || LA == "hide" || LA == "hide pills" || LA == "hide pill" || LA == "hide the pill" || LA == "go to drawer" || LA == "go drawer" || LA == "hide pills in drawer" || LA == "hide pill in drawer"){
            msg("You head over to the drawer.");
            msg("Opening one of the compartments you see a picture of Madeline");
            msg("You lift the picture to hid the pill underneath.");
            msg("You notice a small CD. You first put the pill inside and take out the CD to have a better look at it");
            msg("The label is a bit worn but you can make out");
            msg(chr(34) + "Psyc     ical  valua ion: Mi ha l" + chr(34));
            msg( "[c="+string($00FFFF)+"]Press Enter to Continue[/c]");
            // we are done here, transition to new chapter or something
            global.state = 6;
            break;
        }else {
            global.needsHelp += 1;
            msg( "I don't understand your command");
            if(global.needsHelp == 5){
                msg( "You should hide the pill. Fast, the cupcake is going to get cold.");
                global.needsHelp = 0;
            }
        }
    case 6:
        // also done here. Here we have evidence based on what they chose. (probably hard)
        instance_create(x,y,transitionNextObj);
        break;    

}
