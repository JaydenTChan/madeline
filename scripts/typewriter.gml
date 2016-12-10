//Source: http://gamejolt.com/f/game-maker-super-easy-typewriter-like-dialogue-example/1908
if (characters < message_length) {              //if current character count is less than the amount in current message* 
    hold = mouse_check_button_pressed(2);            //hold is true or false if we hold 'Z' or not
    characters += increase * (1 + hold);        //increase speed based on hold
    message_draw = string_copy(message[message_current], 0, characters); //copy string to current character
} 
else { //if current character is more than the amount in the current message
    if (mouse_check_button_pressed(1) || keyboard_check(vk_enter)) {        //if we press mouse 1
        if (message_current < message_end) {    //if there are more messages left to show (0 -> 6, in our case)
            message_current += 1;               //increase the message by 1
            message_length = string_length(message[message_current]);  //get the new character length for message
            characters = 0;                     //set the characters back to 0
            message_draw = "";                  //clear the drawn text
        }
        else {                                  //if our messages are done (we reach 6, in our case)...
            nothing = 1;
        }
    }
}

if (nothing == 1){
    alpha -= 0.01;
}

if (keyboard_check_pressed(ord("Z"))){
    //Skip introduction
    alpha = 0;
}
