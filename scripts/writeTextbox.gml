draw_set_font(centFont); //Setting up the font
draw_sprite(sprite_index, image_index, x , y);
draw_set_halign(fa_left);       //reset alignment
draw_set_valign(fa_top);

if(txt == ""){
    draw_text_colour(x+10, y+3, "Enter Command", c_white, c_white, c_white, c_white, 0.8);
}else{
    if(blink == false) || (selected == false){
        draw_text_colour(x+10, y+3, txt, c_white, c_white, c_white, c_white, 1);  //draw text
    }else{
        draw_text_colour(x+10, y+3, txt + "|", c_white, c_white, c_white, c_white, 1);
    }
}

draw_set_halign(fa_left);       //reset alignment
draw_set_valign(fa_top);
