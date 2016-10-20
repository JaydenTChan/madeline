// Saving variables

ini_open("game_settings.ini");

// CurrentState
ini_write_real("Current","chapter",global.chapter);
ini_write_real("Current","part",global.part);
ini_write_real("Current","state",global.state);
ini_write_real("Current","timer",global.timer);

// Inventory
str = ds_list_write(global.inventory);
ini_write_string("Inventory", "inventory", str);
str = ds_list_write(global.evidence);
ini_write_string("Inventory", "evidence", str);
str = ds_list_write(global.actions);
ini_write_string("Inventory", "actions", str);

// Save Log
str = ds_list_write(global.log);
ini_write_string("Log", "log", str);

// Settings

//Write to message log
ds_list_add(global.log, "[c="+string($00FFFF)+"]Game saved.[/c]");

ini_close();
