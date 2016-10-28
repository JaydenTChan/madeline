if (global.size == 1){
    length = 31;
    y = 16;
}else{
    length = 9;
    y = 496;
}

if (keyboard_check_pressed(vk_anykey) == true)
{
    switch (keyboard_key)
    {
        case vk_down:
        offset = max(offset - 1, 0);
        break;
        case vk_up:
        offset = min(offset + 1, (ds_list_size(global.log) - min(ds_list_size(global.log), length)));
        break;
        case vk_enter:
        ds_list_add(global.log, "> " + textBoxObj.txt);
        //Reset textbox
        global.lastAction = textBoxObj.txt;
        textBoxObj.txt = "";
        textBoxObj.keyboard_string = "";
        global.timer += 1;
        offset = 0; //Bring the message log back down to the most recent when the plyer uses an action.
        break;
    }
}

//Scroll wheel controls.
    if (mouse_wheel_up()){
        offset = min(offset + 1, (ds_list_size(global.log) - min(ds_list_size(global.log), length)));
    }else if (mouse_wheel_down()){
        offset = max(offset - 1, 0);
    }
