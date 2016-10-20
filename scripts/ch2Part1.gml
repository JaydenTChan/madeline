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
0 = player is in their classroom.

*/

LA = string_lower(global.lastAction);

switch(global.state){
    case 0: //Player is in their classroom.
        if(LA == "Look around"){
            ds_list_add(global.log, "You see your teacher teaching math.");
        }else if(LA == "snooze" || LA == "Doze off"){
            ds_list_add(global.log, "You start to doze off but your teacher wakes you with a stern comment.");
        }else{
            ds_list_add(global.log, "You can't do that right now.");
            global.needsHelp += 1;
            if(global.needsHelp == 5){
                ds_list_add(global.log, "This is an unending hell.");
            }
        }
        break;
        
}


