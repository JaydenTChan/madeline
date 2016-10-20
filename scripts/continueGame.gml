/*
For every new chapter add a new case.
*/

global.cont = 1;
global.intro = 0;

switch(global.chapter){
    case 1:
        ic = instance_create(x,y,transitionSpecificObj);
        ic.rm = chapter1Rm;
    case 2:
        break;
    default:
        break;
}
