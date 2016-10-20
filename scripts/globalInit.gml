// Initialize Global variables here
// These will be the defaults for a new game.

global.state = 0; //Used for the general state of each chapter.
global.chapter = 0;
global.part = 0;
global.timer = 0;   //Counts up for every action
global.intro = 0;   //Initialize for intro
global.cont = 0;    //If player selects continue
global.log = ds_list_create();
global.inventory = ds_list_create();
global.evidence = ds_list_create();
global.actions = ds_list_create();



