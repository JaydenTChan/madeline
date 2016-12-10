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
    case 0:
        if(LA == "look around"||LA == "look"){
            msg("You should probably either [c=255]keep the object[/c] or [c=255]hide it.[/c]")
        }else if(LA == "get rid of object" || LA == "get rid" || LA == "get rid object" || LA == "throw object" || LA == "throw" || LA == "throw the object" || LA == "rid" || LA == "throw it" || LA == "get rid of it"){
            msg( "You throw the object as hard as you can into the darkness.");
            msg( "Quickly you peek back to make sure no one saw you.");
            msg("Michael! Goddamnit Michael - what the hell have you done you monster! ");
            msg("Mark! Put him down Mark you’re hurting him! ");
            msg( "[c="+string($00FFFF)+"]Press Enter to Continue[/c]");
            global.state = 1;
            break;
        }else if(LA == "keep the object" || LA == "keep object" || LA == "keep" || LA == "put object in pocket" || LA == "keep it" || LA == "pocket it" || LA == "hide it" || LA == "hide object" || LA == "keep"){
            msg("You quickly pocket the object. You don't remember exactly where but they don't know I found it.");
            msg("Michael! Goddamnit Michael - what the hell have you done you monster! ");
            msg("Mark! Put him down Mark you’re hurting him! ");
            addEvidence("Mysterious Object");
            msg( "[c="+string($00FFFF)+"]Press Enter to Continue[/c]");
            global.state = 1;
            break;
        }else {
            global.needsHelp += 1;
            msg( "I don't understand your command");
            if(global.needsHelp == 5){
                msg( "The shouting seems to get louder.");
                msg( "You should either [c=255]hide[/c] or [c=255]get rid[/c] of the object");
                global.needsHelp = 0;
            }
            break;
        }
    case 1:
        instance_create(x,y,transitionNextObj);
        break;
        
        /** JAYDEN senpai
         Summary Panel: 
         The “Mysterious Object” has been added to your inventory. (If you selected to “pocket it” in Input 2)
         (Mysterious Object: It’s covered in blood. 
         Fingerprints have faintly dried along the side of it. 
         I don’t know who they belong to.”) +2 (implicates everyone) to All
         
         This part is now done and move onto Ch2P1Intro
        **/
}
