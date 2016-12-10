// Loading variables

ini_open("game_settings.ini"); 

// CurrentState
global.chapter = ini_read_real("Current","chapter", 0);
global.part = ini_read_real("Current", "part",0);
global.state = ini_read_real("Current", "state",0);
global.timer = ini_read_real("Current", "timer", 0);

//Inventory
str = ini_read_string("Inventory", "inventory", "");
if (str != ""){ ds_list_read(global.inventory, str);}
str = ini_read_string("Inventory", "evidence", "");
if (str != ""){ ds_list_read(global.evidence, str);}
str = ini_read_string("Inventory", "actions", "");
if (str != ""){ ds_list_read(global.actions, str);}
str = ini_read_string("Inventory", "questions", "");
if (str != ""){ ds_list_read(global.questions, str);}

//Read Log
str = ini_read_string("Log", "log", "");
if (str != ""){ ds_list_read(global.log, str);}

// Settings
global.img = ini_read_real("Settings", "img", 0);
global.size = ini_read_real("Settings", "size", 0);

ini_close();

