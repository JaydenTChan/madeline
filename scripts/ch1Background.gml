//This is where the background images will change.

switch(global.part){
    case 1:
        switch(global.state){
            case 0:
                draw_sprite(playerRoomSpr,0,x,y);
                break;
            case 1:
                draw_sprite(playerRoomSpr,0,x,y);
                break;
            case 2:
                draw_sprite(playerRoomSpr,0,x,y);
                break;
            case 3:
                draw_sprite(hallwaySpr,0,x,y);
                break;
            case 4:
                draw_sprite(bathroomSpr,0,x,y);
                break;
            case 5:
                draw_sprite(sisterRoomSpr,0,x,y);
                break;
            case 6:
                draw_sprite(foyerSpr,0,x,y);
                break;                                            
        }
        break;
    case 2:
        switch(global.state){
            case 0:
                draw_sprite(kitchenSpr,0,x,y);
                break;
            case 1:
                draw_sprite(kitchenSpr,0,x,y);
                break;                                       
        }
        break;
}
