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

//write your messages in an array, starting at 0, like so
message[0] = "Isn't it weird, Mikey?";
message[1] = "You see it too right, Mikey?";
message[2] = "Mommy tries to hide behind the door every night, but she is not very good at hiding, Mikey.";
message[3] = "You too Mikey. It is not nice to trick Mommy.";
message[4] = "You forget that Mommy is clever and she knows, Mikey.";
message[5] = "She.";
message[6] = "Always.";
message[7] = "Knows.";
message[8] = "But why is she whispering Michael?";

message[9] = "Monday September 3rd, 1990 - 9:32pm";
message[10] = "Age 12";





message_current = 0;        //0 is the first number in our array, and the message we are currently at
message_end = 10;            //7 is the last number in our array
message_draw = "";          //this is what we 'write' out. It's blank right now
increase = 1;               //the speed at which new characters are added
characters = 0;             //how many characters have already been drawn
hold = 0;                   //if we hold 'Z', the text will render faster
nothing = 0;                //Determine if there is still text.
alpha = 1;                  //Alpha value for drawing background.

message_length = string_length(message[message_current]); //get the number of characters in the first message
