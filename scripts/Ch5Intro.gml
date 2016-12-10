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
global.snd = audio_play_sound(nymeriaSnd, 1, 1);
audio_sound_gain(global.snd, 0, 0);
audio_sound_gain(global.snd, 1, 5000);

//write your messages in an array, starting at 0, like so
message[0] = "This is all so eerily alphabetical...";
message[1] = "The Machinist, Memento… Michael 1991-07-09?";
message[2] = "It has a certain Sundance Festivity to it...";
message[3] = "Why not subject ourselves to this little bit of - ";

message[4] = "Light viewing?";
message[5] = "You turn the TV on and play the recording. ";
message[6] = "Try your best to remember Michael.";

message[7] = "Tuesday July 9th, 1991 - 9:05 am";
message[8] = "Age 12";

message_current = 0;        //0 is the first number in our array, and the message we are currently at
message_end = 8;            //7 is the last number in our array
message_draw = "";          //this is what we 'write' out. It's blank right now
increase = 1;               //the speed at which new characters are added
characters = 0;             //how many characters have already been drawn
hold = 0;                   //if we hold 'Z', the text will render faster
nothing = 0;                //Determine if there is still text.
alpha = 1;                  //Alpha value for drawing background.
global.outro = 0;

message_length = string_length(message[message_current]); //get the number of characters in the first message
