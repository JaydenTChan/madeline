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
            msg("You're in the front foyer, to your right is the passageway to the [c=255]kitchen[/c].")
            msg("The stairs to the second floor are in front of you, where [c=255]your room[/c] is.")
            break;
        }else if(LA == "leave" || LA == "go to room" || LA == "go room" || LA == "leave room" || LA == "peace out" || LA == "leave"){
            msg("Your father hears you try to leave.");
            msg("“Did I say it like you had an option? I said come here.”");
            break;
        }else if(LA == "go to kitchen" || LA == "go kitchen" || LA == "go right" || LA == "go into kitchen"){
            msg("You enter the kitchen. Your father is sitting at the table. In his hands, he holds a piece of paper.");
            msg("“Sit down.”");
            global.needsHelp = 0;
            global.state = 1;
            break;
        }else {
            global.needsHelp += 1;
            msg( "I don't understand your command");
            if(global.needsHelp == 5){
                msg( "You should go to the [c=255]kitchen[/c].");
                global.needsHelp = 0;
            }
        }
    case 1:
        if(LA == "look around"||LA == "look"){
            msg("Your father is glaring at you.");
            msg("You dare not look away.");
            break;
        }else if(LA == "sit down" || LA == "sit"){
            msg("You sit down across from your father.");
            msg("“I’m sick of talking about this with you.”");
            msg("“What could this possibly be about Michael? What could I possibly be talking about?”");
            msg("“Let me give you a hint -”");
            msg("“It’s got something to do with this paper I’m holding…”");
            msg("As your father tells you this, the only things that come to mind are a [c=255]story[/c] you were writing or a [c=255]diary entry[/c].");
            global.state = 2;
            global.needsHelp = 0;
            break;
        }else {
            global.needsHelp += 1;
            msg( "I really wouldn't do that if I were you.");
            if(global.needsHelp == 5){
                msg( "You should [c=255]sit down[/c] before your father gets any more angry at you.");
                global.needsHelp = 0;
            }
        }
    case 2:
        if(LA == "look around"||LA == "look"){
            msg("Your father is glaring at you.");
            msg("You dare not look away.");
            break;
        }else if(LA == "a story" || LA == "say a story" || LA == "story" || LA == "ask story" || LA == "ask about story"){
            msg("You pick up the paper.");
            msg("The story reads: ");
            msg("“... Immediately upon entering her room, the smell of blood consumed his perception. There she lay. Lifeless and limp. Murdered.”");
            msg("Your father grabs the paper from your hands. He slowly rips it into pieces. ");
            msg("“Are you fucked up or something buddy? What the hell is wrong with you?”");
            msg("“Why did you come up with this shit?”");
            global.state = 3;
            choicePicker("“Why did you come up with this shit?”","Why father, I got it from you.","Ever since Maddy died…");
            global.needsHelp = 0;
            break;
        }else if(LA == "a diary" || LA == "say a diary entry" || LA == "diary entry" || LA == "ask diary entry" || LA == "ask about diary entry"){
            msg("You pick up the paper.");
            msg("The diary entry reads: ");
            msg("“...I really like being paired up with Mason for science projects. He always pretends like he doesn’t like to work");
            msg("with me in front of everybody but he’s always really nice when we’re working alone. He can be really sweet.”");
            msg("Your father grabs the paper from your hands. He slowly rips it into pieces. ");
            msg("“Are you fucked up or something buddy? What the hell is wrong with you?”");
            msg("“Can you explain to me what this shit is?”");
            msg("“Where the hell did you even come up with this?”");
            global.state = 3;
            choicePicker("“Where the hell did you even come up with this?”","Why father, I got it from you.","Ever since Maddy died…");
            global.needsHelp = 0;
            break;
        }else if(LA == "a report card" || LA == "say a report card" || LA == "report card" || LA == "ask report card" || LA == "ask about report card"){
            msg("Try again smartass");
            break;
        }else {
            global.needsHelp += 1;
            msg( "I don't understand your command.");
            if(global.needsHelp == 5){
                msg( "You should [c=255]give a response[/c] before your father gets any more angry at you.");
                global.needsHelp = 0;
            }
        }
        
    case 3:
        if(LA == "look around"||LA == "look"){
            msg("Your father is expecting an answer.");
        }else if(checkAction("Why father, I got it from you.")){
            addEvidence("Threatened");
            instance_create(x,y,transitionNextObj);
            break;
        }else if(checkAction("Ever since Maddy died…")){
            addEvidence("We don't talk about Madeline");
            ic = instance_create(x,y,transitionSpecificObj);
            ic.rm = Chapter4Outro2Rm;
            break;
        }else {
            global.needsHelp += 1;
            msg( "I don't understand your command");
            if(global.needsHelp == 5){
                global.needsHelp = 0;
            }
        }  

}

