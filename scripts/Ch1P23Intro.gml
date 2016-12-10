//Source: http://gamejolt.com/f/game-maker-super-easy-typewriter-like-dialogue-example/1908

if (global.cont == 1){
    global.intro = 0; //skip intro when entering chapter from continue
    instance_destroy();
}else{
    global.intro = 1; //Introduction is still underway
}


//write your messages in an array, starting at 0, like so
message[0] = "When you look at her, you see " + ds_list_find_value(global.actions, 0) + ", and " + ds_list_find_value(global.actions, 1) + ".";
message[1] = "You hear the terrored cries of your mother hurriedly searching for your father.";
message[2] = chr(34) + "Michael!" + chr(34);
message[3] = "What have you done Michael - Oh God! Mark!";


message_current = 0;        //0 is the first number in our array, and the message we are currently at
message_end = 3;            //7 is the last number in our array
message_draw = "";          //this is what we 'write' out. It's blank right now
increase = 1;               //the speed at which new characters are added
characters = 0;             //how many characters have already been drawn
hold = 0;                   //if we hold 'Z', the text will render faster
nothing = 0;                //Determine if there is still text.
alpha = 1;                  //Alpha value for drawing background.
global.outro = 0;

message_length = string_length(message[message_current]); //get the number of characters in the first message
