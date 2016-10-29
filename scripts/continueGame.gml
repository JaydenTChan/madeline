/*
For every new chapter add a new case.
*/

global.cont = 1;
global.intro = 0;

switch(global.chapter){
    case 2:
        ic = instance_create(x,y,transitionSpecificObj);
        ic.rm = Something_strange_about_Michael;
        break;
    default:
        break;
}
