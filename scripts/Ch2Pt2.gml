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

*/

LA = string_lower(global.lastAction);

switch(global.state){
    case 0: //INPUT 1
        if(LA == "look around"||LA == "look"){
            msg( "It is the middle of the night.");
            msg( "The only thing you can see is the [c=255]neighbour's house.[/c]");
        }else if(LA == "go neighbour's house"||LA == "go to neighbour's house" || LA == "go to neighbours house" || LA == 'go to neighbours' || LA == "go to neighbour"){
            if(checkAction("question")){
                msg( "You approach the neighbours house, they see you through the window and close the blinds.");
                msg( "You know that feeling, its been with you for as long as you can remember. Your sister tugs at you again.");
                msg( "“Come on, lets go to the [c=255]fort.[/c]”");
                msg( "You turn away from the house, smile as best as you can towards your little sister and face the direction of the fort.");
                addAction("neighbours");
            } else {
                msg( "They always pretend that they can’t see us...");
                msg( "“We can't go there Mikey.”");
                //"not good people" is suppose to be in red
                msg( "They're [c=255]not good people.[/c]");
                addAction("question");
            }  
        }else if(checkAction("question")==true&&(LA== "ask not good people"||LA=="ask about not good people")){
            msg( "“They told us that we weren't their problem.“");
            msg( "“Can we go to the fort?”");
            addAction("fort");
        }else if(checkAction("neighbours")==true && (LA == "Ring doorbell" || LA == "ring doorbell" || LA == "ring door bell" || LA=="knock" || LA=="ring neighbours doorbell" )) {
            msg( "As you turn to go back and try one more time, you catch a glimpse of your sister. She looks at you sternly “No.”");
            msg( "Even if you are older, there's some things you just can't ignore. You decide against it.")
        }else if (checkAction("fort")==true&&(LA== "go to fort"||LA=="go fort")){
            msg( "You follow Madeline to the forest behind your house. You can hear screaming coming from your house. ");
            msg("“It's too dark Mikey. I can't see where it is. I think if we go straight...”");
            global.needsHelp = 0;
            global.state = 1;
        }else {
            global.needsHelp += 1;
            msg( "I don't understand your command");
            if(global.needsHelp == 5 ){
                if(checkAction("fort")==false){
                    msg( "Maybe I should head towards the neighbour's house");
                } else {
                    msg( "Do I go to the fort or the neighbour's house?");
                }
            }
        }
        break;
    case 1:
        if(LA == "look around"||LA == "look"){
            msg( "You can go [c=255]straight[/c], [c=255]left[/c] or [c=255]right[/c].");
        }else if(LA == "go straight" || LA == "walk straight"|| LA == "run straight"){
            if (checkAction("straightPath")==false) {
                msg("You run straight into a tree. As you lie on the ground recovering, you hear a quiet “I'm sorry.");
                msg("I thought it was...” from behind you.");
                addAction("straightPath");
            } else {
                msg( "You might be dumb, but not that dumb. You remember there's a tree in the way.");
            }
        }else if (LA == "go left" || LA == "walk left" || LA == "run left"){
            msg( "YYou and Madeline are surrounded by the thickness of the forest. You can hear someone's footsteps coming from the house. Y");
            msg("You're almost there.");
            msg( "“I think if we go left here…”");
            global.needsHelp = 0;
            global.state = 2;
        }else if(LA == "go right" || LA == "walk right"|| LA == "run right") {
            msg( "There is a large sign that says “No.”. It's haunting allure permits you to obey. ");
        }else {
            global.needsHelp += 1;
            msg( "I don't understand your command");
            if(global.needsHelp == 5 ){
                msg( "I should really get to the fort. It's chilly and scary out here.");
            }
        }
        break;
    case 2:
        if(LA == "look around"||LA == "look"){
             msg( "You can go [c=255]straight[/c], [c=255]left[/c] or [c=255]right[/c].");
        }else if(LA == "go straight" || LA == "walk straight"|| LA == "run straight"){
            msg( "You and Madeline have arrived at the Fort. The footsteps and the shouting are far away.");
            global.needsHelp = 0;
            global.state = 3;
        }else if (LA == "go left" || LA == "walk left"|| LA == "run left"){
            if (checkAction("leftPath")==false) {
                msg( "You run into a large thorny bush. As you painfully drag yourself out, you hear a quiet “I'm sorry. I swear - I was sure...“");
                addAction("leftPath");
            } else {
                msg( "You might be dumb, but not that dumb. You remember there's a large thorny trap that way.");
            }
        }else if(LA == "go right" || LA == "walk right"|| LA == "run right") {
            msg( "You can see a figure in the distance coming from that direction. You quietly turn back. ");
        }else {
            global.needsHelp += 1;
            msg( "I don't understand your command");
            if(global.needsHelp == 5 ){
                msg( "I should really get to the fort. It's chilly and scary out here.");
            }
        }
        break;
    case 3:
        if(LA == "look around"||LA == "look"){
            if(checkAction("inFort")==false) {
                msg( "The fort stands in your path. You hear a coyote, you better get inside.");
            } else {
                msg( "The fort is mostly empty, except for a small mattress in the corner, ");
                msg(" and a 1962 edition Playboy calendar that you’ve stolen from your father.");
                msg( "the light switch to your right, and the old tv with the vcr player on the left. ");
                msg( "A poster hangs behind the mattress. Madeline is on the mattress, [c=255]crying.[/c]");
            }
        }else if(checkAction("inFort")==false&&(LA == "enter fort" || LA == "go into fort"|| LA == "go in fort" || LA == "go to fort" || LA == "go fort")){
            msg( "You and Madeline enter the Fort. It is cold and quiet. You can hear Madeline softly crying.");
            addAction("inFort");
        }else if (checkAction("inFort")== true &&(LA == "sit on mattress" || LA == "hug madeline" || LA == "hug her" || LA == "talk to her" || LA == "walk mattress"|| LA == "walk to mattress"|| LA == "talk to madeline"|| LA == "talk madeline"|| LA == "ask about crying"|| LA == "hold her"|| LA == "hold madeline" || LA = "comfort her" || LA = "comfort madeline")){
            // go to outro!!!!!!!!!!!! idk how
            addEvidence("Fearful");
            instance_create(x,y,transitionNextObj);
            break;
        }else if (checkAction("inFort") == true && (LA == "turn on light switch" || LA == "turn on light" || LA == "switch light on" || LA == "switch light" )){
            msg("Better not. They might see you if you do.");
        } else if( checkAction("inFort") == true && (LA == "turn on tv" || LA == "turn on television" || LA == "switch tv on" || LA == "switch television" )){    
            msg("You try to turn on the television. But it does not appear to turn on.");
            msg("However, there is a small buzzing sound coming from it");
        }else {
            global.needsHelp += 1;
            msg( "I don't understand your command");
            if(global.needsHelp == 5 ){
                msg( "I should go see why Madeline is crying. Maybe I should [c=255]comfort her.[/c]");
            }
        }
        break;
}
