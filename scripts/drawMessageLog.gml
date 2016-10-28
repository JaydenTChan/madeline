if(global.intro == 0){
    //Only draw when introduction is over.
    var i, n, line = "";
    if (global.size == 0){draw_sprite(messageLogSpr, 0, x, y);}else{
    draw_sprite(messageLogBigSpr, 0, x, y);
    }
    draw_set_colour(c_white);
    for (i = 0; i < min(ds_list_size(global.log), length); i++)
    {
        line += string(ds_list_find_value(global.log, i + max(ds_list_size(global.log) - length, 0) - offset)) + "#";
    }
    draw_text_colortags(x+10, y+3, line);
}
