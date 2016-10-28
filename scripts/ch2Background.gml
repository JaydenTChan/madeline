//This is where the background images will change.

if(global.img != 1){ draw_sprite(blackSpr,0,x,y); }else{
switch(global.part){
    case 1:
        switch(global.state){
            case 0:
                draw_sprite(classroomSpr,0,x,y);
                break;                                          
        }
        break;
    case 2:
        break;
}//End Switch
}//End Else
