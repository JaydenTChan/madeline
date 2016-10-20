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
0 = player is still in bed
1 = player is standing in his room, the door is closed.
2 = player is standing in his room, the door is open.
3 = player is outside in the hallway.
4 = player is in the washroom.
5 = player is in sister's room.
6 = player is down stairs.


*/

LA = string_lower(global.lastAction);

switch(global.state){
    case 0: //Player in room in bed.
        if(LA == "get up" || LA == "stand up" || LA == "get out of bed"){
            ds_list_add(global.log, "You get up out of bed.");
            global.state = 1;  //Switch to state 1
            global.needsHelp = 0;
        }else if(LA == "go back to sleep" || LA == "sleep" || LA == "go back to bed" || LA == "snooze"){
            ds_list_add(global.log, "It's already morning you should get up.");
        }else{
            ds_list_add(global.log, "You can't do that right now.");
            
            global.needsHelp += 1;
            if(global.needsHelp == 5){
                ds_list_add(global.log, "Maybe you should get out of bed.");
            }
        }
        break;
        
    case 1: //Player is standing up in his room.
        if(LA == "open door"){
            ds_list_add(global.log, "You open the door.");
            ds_list_add(global.log, "You see the hallway outside your room.");
            global.state = 2; //Switch to state 2
            global.needsHelp = 0;
        }else if(LA == "leave room" || LA == "exit room"){
            ds_list_add(global.log, "The door is still closed.");
        }else if(LA == "kick open door"){
            ds_list_add(global.log, "You break your door open.");
            ds_list_add(global.log, "... what are you doing?");
            ds_list_add(global.log, "You spend an hour fixing your door.");
        }else if(LA == "look around"){
            ds_list_add(global.log, "You see that your door is closed.");
            ds_list_add(global.log, "Your computer sits idly by your window.");
            ds_list_add(global.log, "Your room is a bit of a mess; there are several clothes strewn about.");
        }else{
            ds_list_add(global.log, "You can't do that right now.");
            global.needsHelp += 1;
            if(global.needsHelp == 5){
                ds_list_add(global.log, "You should probably go shower to get ready for school.");
            }
        }
        break;
        
    case 2: //Player is standing up in his room with the door open.
        if(LA == "look around"){
            ds_list_add(global.log, "You see that your door is open.");
            ds_list_add(global.log, "Your computer sits idly by your window.");
            ds_list_add(global.log, "Your room is a bit of a mess; there are several clothes strewn about.");
        }else if(LA == "leave room" || LA == "exit room" || LA == "go to hallway"){
            ds_list_add(global.log, "You leave your room and enter the hallway.");
            global.needsHelp = 0;
            global.state = 3;
        }else{
            ds_list_add(global.log, "You can't do that right now.");
            global.needsHelp += 1;
            if(global.needsHelp == 5){
                ds_list_add(global.log, "You should probably go shower to get ready for school.");
            }
        }
        break;
        
    case 3: //Player is standing in the hallway outside his room.
        if(LA == "look around"){
            ds_list_add(global.log, "You see your sister's room, the shared bathroom and your parent's room.");
            ds_list_add(global.log, "There are also stairs heading downstairs.");
        }else if(LA == "go to bathroom" || LA == "enter bathroom" || LA == "go to restroom"){
            ds_list_add(global.log, "You enter the bathroom");
            global.needsHelp = 0;
            global.state = 4;
        }else if(LA == "go to sister's room" || LA == "go to sisters room" || LA == "enter sisters room" || LA = "enter sister's room"){
            ds_list_add(global.log, "You enter your sister's room.");
            ds_list_add(global.log, "It looks dusty. All her belongings are neatly arranged.");            
            global.needsHelp = 0;
            global.state = 5;
        }else if(LA == "go to parent's room" || LA == "enter parent's room" || LA == "enter parents room" || LA == "go to parents room"){
            ds_list_add(global.log, "I don't think I should go into mom and dad's room.");         
        }else if(LA == "go downstairs"){
            if(ds_list_find_index(global.actions, "shower") != -1){
                ds_list_add(global.log, "You walk down the stairs.");      
                ds_list_add(global.log, "You see the kitchen, front door and living room.");            
                global.needsHelp = 0;
                global.state = 6;
            }else{
                ds_list_add(global.log, "I should take a shower first.");      
            }
        }else{
            ds_list_add(global.log, "You can't do that right now.");
            global.needsHelp += 1;
            if(global.needsHelp == 5){
                if (ds_list_find_index(global.actions, "shower") == -1){
                    ds_list_add(global.log, "You should probably go shower to get ready for school.");
                }else{
                    ds_list_add(global.log, "You should probably eat breakfast.");
                }
            }
        }
        break;
    
    case 4: //Player is in the washroom
        if(LA == "look around"){
            ds_list_add(global.log, "You see a plain toilet, sink and shower.");
        }else if(LA == "take a shower" || LA == "take shower" || LA == "shower" || LA == "use shower"){
            if(ds_list_find_index(global.actions, "shower") == -1){
                ds_list_add(global.log, "You take a shower.");
                global.needsHelp = 0;
                ds_list_add(global.actions, "shower");
            }else{
                ds_list_add(global.log, "You've already showered.");
            }
        }else if(LA == "take a piss" || LA == "pee" || LA == "take a pee" || LA == "use toilet" || LA == "take a shit"){
            if(ds_list_find_index(global.actions, "toilet") == -1){
                ds_list_add(global.log, "You relieve yourself.");
                ds_list_add(global.actions, "toilet");
            }else{
                ds_list_add(global.log, "You've already relieved yourself.");
            }
        }else if(LA == "leave room" || LA == "exit room"){
            ds_list_add(global.log, "You head out of the bathroom back into the hallway.");
            global.needsHelp = 0;
            global.state = 3;
        }else{
            ds_list_add(global.log, "You can't do that right now.");
            global.needsHelp += 1;
            if(global.needsHelp == 5){
                if (ds_list_find_index(global.actions, "shower") == -1){
                    ds_list_add(global.log, "You should probably go shower to get ready for school.");
                }else{
                    ds_list_add(global.log, "You should probably eat breakfast.");
                }
            }
        }
        break;
    
    case 5: //Player is in their sister's room
        if(LA == "look around"){
            ds_list_add(global.log, "You notice her old [c=255]teddy bear[/c] on the floor.");
        }else if(LA == "take teddy bear" || LA == "pick up teddy bear" || LA == "get teddy bear"){
            ds_list_add(global.log, "You pick up the teddy bear.");
            ds_list_add(global.log, "Maybe I should [c=255]ask mom about this[/c].");
            ds_list_add(global.inventory, "teddy");
        }else if(LA == "leave room" || LA == "exit room"){
            ds_list_add(global.log, "You head back out into the hallway.");
            global.state = 3;
            global.needsHelp = 0;
        }else{
            ds_list_add(global.log, "You can't do that right now.");
            global.needsHelp += 1;
            if(global.needsHelp == 5){
                if (ds_list_find_index(global.actions, "shower") == -1){
                    ds_list_add(global.log, "You should probably go shower to get ready for school.");
                }else{
                    ds_list_add(global.log, "You should probably eat breakfast.");
                }
            }
        }
        break;
    
    case 6: //Player is in the foyer downstairs.
        if(LA == "look around"){
            ds_list_add(global.log, "You see the kitchen, front door and living room.");
        }else if(LA == "go to living room" || LA == "enter living room"){
            ds_list_add(global.log, "You don't have time for that right now. You should get ready for school.");
        }else if(LA == "go upstairs"){
            ds_list_add(global.log, "You go up the stairs.");
            global.state = 3;
        }else if(LA == "go to kitchen" || LA == "enter kitchen"){
            ds_list_add(global.log, "You go into the kitchen...");
            global.needsHelp = 0;
            switchToPart(chapter1Part2Obj);
        }else{
            ds_list_add(global.log, "You can't do that right now.");
            global.needsHelp += 1;
            if(global.needsHelp == 5){
                ds_list_add(global.log, "You should probably eat breakfast.");
            }
        }
        break;
        
}


