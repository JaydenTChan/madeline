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
global.snd = audio_play_sound(melancholySnd, 1, 1);
audio_sound_gain(global.snd, 0, 0);
audio_sound_gain(global.snd, 1, 5000);


//write your messages in an array, starting at 0, like so
message[0] = "It doesn't hurt when they talk about Dad.";
message[1] = "Father - as he is so dotingly referred to.";
message[2] = "Father, because his attentiveness only seems to be directed at our misdemeanors.";
message[3] = "Father, because he fails to realize that most of this is hereditary.";

message[4] = "Monday July 9th, 1992 - 3:12 am";
message[5] = "Age 13";





message_current = 0;        //0 is the first number in our array, and the message we are currently at
message_end = 5;            //7 is the last number in our array
message_draw = "";          //this is what we 'write' out. It's blank right now
increase = 1;               //the speed at which new characters are added
characters = 0;             //how many characters have already been drawn
hold = 0;                   //if we hold 'Z', the text will render faster
nothing = 0;                //Determine if there is still text.
alpha = 1;                  //Alpha value for drawing background.
global.outro = 0;

message_length = string_length(message[message_current]); //get the number of characters in the first message
