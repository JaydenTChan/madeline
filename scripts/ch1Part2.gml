/*
Chapter 1, Part 2

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

Also take note of what each state means in a comment.

States:
0 = player is sitting down with eggs in front of him.
1 = player is standing in his room, the door is closed.

*/

LA = string_lower(global.lastAction);

switch(global.state){
    case 0: //Player is sitting down with eggs in front of him.
        if(LA == "eat" || LA == "eat eggs" || LA == "devour eggs"){
            ds_list_add(global.log, "You eat the eggs and toasts greedily.");
            ds_list_add(global.log, chr(34) + "Thanks mom." + chr(34));
            global.state = 1;  //Switch to state 1
            global.needsHelp = 0;
        }else if(LA == "don't eat" || LA == "do nothing"){
            ds_list_add(global.log, chr(34) + "What's wrong Michael? Not hungry?" + chr(34));
            ds_list_add(global.log, chr(34) + "You should eat it, breakfast is the most important meal after all!" + chr(34));
            ds_list_add(global.log, "You eat the eggs and toast after being pestered by your mom.");
            global.state = 1;  //Switch to state 1
            global.needsHelp = 0;
        }else if(LA == "look around"){
            ds_list_add(global.log, "You see your eggs sitting on your plate.");
        }else{
            ds_list_add(global.log, "You can't do that right now.");
            global.needsHelp += 1;
            if(global.needsHelp == 5){
                ds_list_add(global.log, "Maybe you should eat your eggs.");
            }
        }
        break;
        
    case 1: //Player is sitting down after having eaten eggs.
        if(LA == "look around"){
            ds_list_add(global.log, "You see your mom washing the dishes.");
        }else if(LA == "go to school" || LA == "leave for school"){
            ds_list_add(global.log, "You go to school.");
            a1 = "You enter the kitchen, your mom smiles sweetly at you.";
            a2 = "It looks dusty. All her belongings are neatly arranged.";
            a3 = "Remember Nothing";
            if(ds_list_find_index(global.actions, "teddy") != -1){
                a1 = chr(34) + "Your mom's eyes widen slightly. She seems unsure how to answer." + chr(34);
                a2 = chr(34) + "I'm not sure; I think dad bought it for her." + chr(34);
                a3 = "Madeline's Teddy Bear";
            }     
            evidencePicker(a1, a2, a3);
        }else if(LA == "where is Madeline's teddy bear from?" || LA == "ask about teddy" || LA == "ask about teddy bear"){
            if(ds_list_find_index(global.inventory, "teddy") != -1){
                ds_list_add(global.log, "Your mom's eyes widen slightly. She seems unsure how to answer.");
                ds_list_add(global.log, chr(34) + "Why do you ask? I'm not sure; I think dad bought it for her." + chr(34));
                ds_list_add(global.actions, "teddy");
            }else{
                ds_list_add(global.log, "Why am I asking this again?");
            }
        }else{
            ds_list_add(global.log, "You can't do that right now.");
            global.needsHelp += 1;
            if(global.needsHelp == 5){
                ds_list_add(global.log, "Time for you to go to school.");
            }
        }
        break;
        
}


