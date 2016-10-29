//This is where the background images will change.
//Make sure there's a case for each part/state in the chapter

if(global.img != 1){ draw_sprite(blackSpr,0,x,y); }else{
switch(global.part){
    //Which part in the chapter?
    case 1:
        switch(global.state){
        //What state?
            case 0:
                draw_sprite(playerRoomDarkSpr,0,x,y);
                break;
            case 1:
                draw_sprite(hallwayDarkSpr,0,x,y);
                break;
            case 2:
                draw_sprite(sisterRoomDarkSpr,0,x,y);
                break;
            case 3:
                draw_sprite(sisterRoomDarkSpr,0,x,y);
                break;                                          
        }
        break;
    case 2:
        switch(global.state){
            case 0:
                draw_sprite(neighbourSpr,0,x,y);
                break;
            case 1:
                draw_sprite(forestSpr,0,x,y);
                break;         
            case 2:
                draw_sprite(forest2Spr,0,x,y);
                break;
            case 3:
                draw_sprite(fortSpr,0,x,y);
                break;                              
        }
        break;
}//End Switch
}//End Else

