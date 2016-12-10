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
global.snd = audio_play_sound(abusedSnd, 1, 1);
audio_sound_gain(global.snd, 0, 0);
audio_sound_gain(global.snd, 1, 5000);

//write your messages in an array, starting at 0, like so
message[0] = "You've never really been one for words.";
message[1] = "That was always my job wasn't it?";
message[2] = "Telling them where we went when we were too afraid to be home.";
message[3] = "Helping you to hide what you didn’t want them to see.";
message[4] = "And now that you’re all alone,";
message[5] = "You wonder, ";
message[6] = "What would Maddy say?";

message[7] = "Sunday July 9th, 1989 - 12:33 pm";
message[8] = "Age 11";

message[9] = "You are standing over the lifelessly limp body of your dead sister Madeline. ";
message[10] = "Her cold gaze calmly stares back at you.";
message[11] = "When you look at her, you see:";

msg( "You are standing over the lifelessly limp body of your dead sister Madeline. ");
msg( "Her cold gaze calmly stares back at you.");
msg( "When you look at her, you see:");


message_current = 0;        //0 is the first number in our array, and the message we are currently at
message_end = 11;            //7 is the last number in our array
message_draw = "";          //this is what we 'write' out. It's blank right now
increase = 1;               //the speed at which new characters are added
characters = 0;             //how many characters have already been drawn
hold = 0;                   //if we hold 'Z', the text will render faster
nothing = 0;                //Determine if there is still text.
alpha = 1;                  //Alpha value for drawing background.
global.outro = 0;

message_length = string_length(message[message_current]); //get the number of characters in the first message
