//Source: http://gamejolt.com/f/game-maker-super-easy-typewriter-like-dialogue-example/1908

if (global.cont == 1){
    global.intro = 0; //skip intro when entering chapter from continue
    instance_destroy();
}else{
    global.intro = 1; //Introduction is still underway
}

// Edit for each chapter starting here

//write your messages in an array, starting at 0, like so
message[0] = "It's been 2 years...";
message[1] = "My sister mysteriously disappeared one night.";
message[2] = "She asked me to let her sleep with me.";
message[3] = "She said she was scared.";
message[4] = "I said no.";
message[5] = "I mean what else would an 11 year old boy like me have said?";
message[6] = "But.";
message[7] = "I wish I had said yes.";

message_current = 0;        //0 is the first number in our array, and the message we are currently at
message_end = 7;            //7 is the last number in our array
message_draw = "";          //this is what we 'write' out. It's blank right now
increase = 1;               //the speed at which new characters are added
characters = 0;             //how many characters have already been drawn
hold = 0;                   //if we hold 'Z', the text will render faster
nothing = 0;                //Determine if there is still text.
alpha = 1;                  //Alpha value for drawing background.

message_length = string_length(message[message_current]); //get the number of characters in the first message
