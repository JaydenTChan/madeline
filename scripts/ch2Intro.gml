//Source: http://gamejolt.com/f/game-maker-super-easy-typewriter-like-dialogue-example/1908

if (global.cont == 1){
    global.intro = 0; //skip intro when entering chapter from continue
    instance_destroy();
}else{
    global.intro = 1; //Introduction is still underway
}

//==== Edit for each chapter starting here ====//
// Audio to play place here
audio_play_sound(isolationSnd, 1, 1);

//Panel 1
message[0] = "No.";
message[1] = "You really don't know.";
message[2] = "You'll never know.";
message[3] = "You didn’t see the way he looked at me when we found her.";
message[4] = "He didn’t even try to hide the fact that he did it.";

//Panel 2
message[5] = "He's a kid.";
message[6] = "He is a nine-year-old boy.";
message[7] = "He still plays with trains for God’s sake.";


//Panel 3
message[8] = "You want to hide behind that excuse so that you can pretend to everyone that everything is alright?";
message[9] = "That's fine.";
message[10] = "That's fucking fantastic.";
message[11] = "But what are you going to do when they ask about how she almost died today?";
messgae[12] = "That he plays with a goddam trainset?";

//Panel 4
message[13] = "He is our son.";
message[14] = "You know he's not capable of this.";
message[15] = "Do you even know anything about him?";

//Panel 5
message[16] = "I know that he’s a fucking Psycho.";
message[17] = "Why do you think he doesn't have any friends?";
message[18] = "He doesn't even talk to anyone except that goddam voices in his head.";

//Panel 6
message[19] = "Maybe he wouldn’t feel so insecure if you began to act like a parent.";

//Panel 7
message[20] = "You want to see me be a parent right now?";
message[21] = "Watch me be a parent right now.";

//Panel 8
message[22] = "You’ve done it now, haven’t you Michael?";
message[23] = "You hear those footsteps?";
message[24] = "Sounds like someone is in a lot of trouble...";


message_current = 0;        //0 is the first number in our array, and the message we are currently at
message_end = 24;           //24 is the last number in our array
message_draw = "";          //this is what we 'write' out. It's blank right now
increase = 1;               //the speed at which new characters are added
characters = 0;             //how many characters have already been drawn
hold = 0;                   //if we hold 'Z', the text will render faster
nothing = 0;                //Determine if there is still text.
alpha = 1;                  //Alpha value for drawing background.

message_length = string_length(message[message_current]); //get the number of characters in the first message
