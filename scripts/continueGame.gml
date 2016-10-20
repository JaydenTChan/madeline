/*
For every new chapter add a new case.
*/

global.cont = 1;
global.intro = 0;

switch(global.chapter){
    case 1:
        ic = instance_create(x,y,transitionSpecificObj);
        ic.rm = chapter1Rm;
        break;
    case 2:
        ic = instance_create(x,y,transitionSpecificObj);
        ic.rm = chapter2Rm;
        break;
    default:
        break;
}
