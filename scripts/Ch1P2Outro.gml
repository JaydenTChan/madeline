//Panel 1
message[0] = "As you lose consciousness, you hear the faint and hallowed echoes of the moments before..."
message[1] = chr(34) + "Happy Birthday. Dear Michael." + chr(34)

message_current = 0;        //0 is the first number in our array, and the message we are currently at
message_end = 1;           //24 is the last number in our array
message_draw = "";          //this is what we 'write' out. It's blank right now
increase = 1;               //the speed at which new characters are added
characters = 0;             //how many characters have already been drawn
hold = 0;                   //if we hold 'Z', the text will render faster
nothing = 0;                //Determine if there is still text.
alpha = 1;                  //Alpha value for drawing background.
global.outro = 1;
global.size = 0;

message_length = string_length(message[message_current]); //get the number of characters in the first message
