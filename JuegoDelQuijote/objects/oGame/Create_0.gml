// Initialise & Globals
randomize();
global.AllItems = ds_grid_create(0, Book.Height);

global.gamePaused = false;
global.textSpeed = 0.75;

global.iCamera = instance_create_layer(0,0, layer, oCamera);


display_set_gui_size(RESOLUTION_W,RESOLUTION_H);

room_goto(ROOM_START);
