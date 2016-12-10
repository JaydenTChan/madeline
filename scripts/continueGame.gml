/*
For every new chapter add a new case.
*/

global.cont = 1;
global.intro = 0;

switch(global.chapter){
    case 1:
        ic = instance_create(x,y,transitionSpecificObj);
        ic.rm = Chapter1Pt2Rm;
        break;
    case 2:
        ic = instance_create(x,y,transitionSpecificObj);
        ic.rm = Something_strange_about_Michael;
        break;
    case 3:
        ic = instance_create(x,y,transitionSpecificObj);
        ic.rm = Chapter3Rm;
        break;
    case 4:
        ic = instance_create(x,y,transitionSpecificObj);
        ic.rm = Chapter4Rm;
        break;
    case 5:
        ic = instance_create(x,y,transitionSpecificObj);
        ic.rm = Chapter5Rm;
        break;
    default:
        break;
}
