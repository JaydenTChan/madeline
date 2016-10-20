draw_sprite_ext(introBackSpr, 0, x, y, 1, 1, 0, -1, alpha);

draw_set_halign(fa_center);       //reset alignment
draw_set_valign(fa_center);

draw_text_colour(x, y, message_draw, c_white, c_white, c_white, c_white, alpha); //draw the text at the coordinates
if (alpha == 0){
    global.intro = 0;
    instance_destroy();                 //destroy the object
}
