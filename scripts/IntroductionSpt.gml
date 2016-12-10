//Source: http://gamejolt.com/f/game-maker-super-easy-typewriter-like-dialogue-example/1908

if (global.cont == 1){
    global.intro = 0; //skip intro when entering chapter from continue
    instance_destroy();
}else{
    global.intro = 1; //Introduction is still underway
}

//==== Edit for each chapter starting here ====//
// Audio to play place here
audio_sound_gain(global.snd, 0, 2500);
global.snd = audio_play_sound(goodbyeSnd, 1, 1);
audio_sound_gain(global.snd, 0.5, 5000);

//write your messages in an array, starting at 0, like so
message[0] = "Your name has already been decided";
message[1] = "Your family predetermined";
message[2] = "Your circumstance unchangeable";
message[3] = "Although you may not be able to control much...";
message[4] = "You can at least pick your favorite childhood toy";

message_current = 0;        //0 is the first number in our array, and the message we are currently at
message_end = 4;            //7 is the last number in our array
message_draw = "";          //this is what we 'write' out. It's blank right now
increase = 1;               //the speed at which new characters are added
characters = 0;             //how many characters have already been drawn
hold = 0;                   //if we hold 'Z', the text will render faster
nothing = 0;                //Determine if there is still text.
alpha = 1;                  //Alpha value for drawing background.
global.outro = 0;

message_length = string_length(message[message_current]); //get the number of characters in the first message
