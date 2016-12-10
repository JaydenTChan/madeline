// Initialize Global variables here
// These will be the defaults for a new game.

global.state = 0;   //Used for the general state of each chapter.
global.chapter = 0; //Used so that continue can find the correct chapter from a saved game.
global.part = 0;    //Similar to global.chapter
global.timer = 0;   //Counts up for every action
global.intro = 0;   //Initialize for intro
global.cont = 0;    //If player selects continue
global.img = 1;     //If images should be displayed
global.size =0;     //Larger Textbox
global.log = ds_list_create();
global.inventory = ds_list_create();
global.evidence = ds_list_create();
global.actions = ds_list_create();
global.questions = ds_list_create();

ds_list_add(global.questions, 0); //0
ds_list_add(global.questions, 0); //1
ds_list_add(global.questions, 0); //2
ds_list_add(global.questions, 0); //3
ds_list_add(global.questions, 0); //Pos 4 for questions asked




