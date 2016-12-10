//Source: http://gamejolt.com/f/game-maker-super-easy-typewriter-like-dialogue-example/1908

if (global.cont == 1){
    global.intro = 0; //skip intro when entering chapter from continue
    instance_destroy();
}else{
    global.intro = 1; //Introduction is still underway
}

//==== Edit for each chapter starting here ====//
// Audio to play place here
global.snd = audio_play_sound(isolationSnd, 1, 1);
audio_sound_gain(global.snd, 0, 0);
audio_sound_gain(global.snd, 1, 5000);

//Panel 1
message[0] = "No.";
message[1] = "You really don't know.";
message[2] = "You'll NEVER know.";
message[3] = "You didn’t see the way he looked at me when we found her.";
message[4] = "He didn’t even try to hide the fact that he did it.";

//Panel 2
message[5] = "He's a kid.";
message[6] = "He is a eight-year-old boy.";
message[7] = "He still plays with "+ ds_list_find_value(global.inventory, 0) +" for God's sake!";


//Panel 3
message[8] = "You want to hide behind that excuse so that you can pretend to everyone that everything is alright?";
message[9] = "That's fine.";
message[10] = "That's fucking fantastic.";
message[11] = "But what are you going to do when they ask about how she's going to the hospital?";
message[12] = "That he plays with goddamn " + ds_list_find_value(global.inventory, 0) + "(s)?";

//Panel 4
message[13] = "He is our son.";
message[14] = "You know he's not capable of this.";
message[15] = "Do you even know anything about him?";

//Panel 5
message[16] = "I know that he's psychotic.";
message[17] = "Why do you think he doesn't have any friends?";
message[18] = "He doesn't even talk to anyone except the goddamn voices in his head.";

//Panel 6
message[19] = "Maybe he wouldn't feel so insecure if you began to act like a parent.";

//Panel 7
message[20] = "You want to see me be a parent right now?";
message[21] = "Watch me be a parent right now.";

//Panel 8
message[22] = "You've done it now, haven't you Michael?";
message[23] = "You hear those footsteps?";
message[24] = "Sounds like someone is in a lot of trouble...";

message[25] = "Friday May 13th, 1988 - 11:57 pm";
message[26] = "Age: 10";


message_current = 0;        //0 is the first number in our array, and the message we are currently at
message_end = 26;           //24 is the last number in our array
message_draw = "";          //this is what we 'write' out. It's blank right now
increase = 1;               //the speed at which new characters are added
characters = 0;             //how many characters have already been drawn
hold = 1;                   //if we hold 'Z', the text will render faster
nothing = 0;                //Determine if there is still text.
alpha = 1;                  //Alpha value for drawing background.
global.outro = 0;

message_length = string_length(message[message_current]); //get the number of characters in the first message
