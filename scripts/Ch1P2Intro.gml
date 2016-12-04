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
message[0] = "Once upon a time, there was a happy couple.";
message[1] = "And that happy couple had been blessed with beautiful children.";
message[2] = "A beautiful son named Michael -";
message[3] = "And a beautiful daughter named Madeline";
message[4] = "They made their home in a small house in a small city.";
message[5] = "Probably somewhere near you...";
message[6] = "One day, Young Michael was wandering along into a place.";
message[7] = "It is a place he shouldn't have never gone to.";
message[8] = "Something he shouldn't have seen.";
message[9] = "-It is cold-";
message[10] = "A place he stood too long for.";
message[9] = "-It is very cold-";
message[10] = "And where the word that was softly spoken became ghosts.";
message[11] = chr(34) + "Maddy." + chr(34);

message[12] = "What came after...";
message[13] = "What did come after?";

message[14] = "Sunday July 9th, 1989 - 12:33 pm";
message[15] = "Age 11";





message_current = 0;        //0 is the first number in our array, and the message we are currently at
message_end = 15;            //7 is the last number in our array
message_draw = "";          //this is what we 'write' out. It's blank right now
increase = 1;               //the speed at which new characters are added
characters = 0;             //how many characters have already been drawn
hold = 0;                   //if we hold 'Z', the text will render faster
nothing = 0;                //Determine if there is still text.
alpha = 1;                  //Alpha value for drawing background.

message_length = string_length(message[message_current]); //get the number of characters in the first message
