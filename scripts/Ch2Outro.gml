//Panel 1
message[0] = "I have to tell you a secret Mikey."

//Panel 2
message[1] = "It's just for us though. No telling, promise?"

//Panel 3
message[2] = "Remember it's a secret. You can't tell anyone no matter what!"
message[3] = "Not even daddy."

//Panel 4
message[4] = "Someone is trying to hurt me Mikey. I'm scared."

message_current = 0;        //0 is the first number in our array, and the message we are currently at
message_end = 4;           //24 is the last number in our array
message_draw = "";          //this is what we 'write' out. It's blank right now
increase = 1;               //the speed at which new characters are added
characters = 0;             //how many characters have already been drawn
hold = 0;                   //if we hold 'Z', the text will render faster
nothing = 0;                //Determine if there is still text.
alpha = 1;                  //Alpha value for drawing background.

message_length = string_length(message[message_current]); //get the number of characters in the first message
