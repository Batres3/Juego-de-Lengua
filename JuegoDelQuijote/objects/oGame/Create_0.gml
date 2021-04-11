// Initialise & Globals
randomize();
global.AllItems = ds_grid_create(0, Book.Height);

global.gamePaused = false;
global.textSpeed = 0.75;
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDir = 0;
global.iLifted = noone;
global.lastState = undefined;
global.currentItem = noone;

global.iCamera = instance_create_layer(0,0, layer, oCamera);


//All item properties
global.AllItems = ds_grid_create(0, Book.Height);


enum Power{
	Lightning,
	Wind,
	Water,
	Fire,
	Earth,
	Height
}

enum Book{
	Name,
	Sprite,
	Power,
	Object,
	Height
}

enum Type{
	Save,
	Destroy
}

AddItemToMasterList(["The Feynman Lectures on Physics", sFeynmanLec, Power.Lightning, oFeynmanLec]);
AddItemToMasterList(["Genio en 21 dias", sGenioEn, Power.Wind, oGenioEn]);
AddItemToMasterList(["Brian Weiss", sBrianWeiss, Power.Fire, oBrianWiess]);
AddItemToMasterList(["Cartas de amor algo", sCartasAmor, Power.Earth, oCartasAmor]);
AddItemToMasterList(["Flyte", sFlyte, Power.Wind, oFlyte]);
AddItemToMasterList(["Diario de una ilusion", sDiarioDeIlusion, Power.Earth, oDiariosDeIlusion]);
AddItemToMasterList(["Harry Potter", sHarryPotter, Power.Water, oHarryPotter]);
AddItemToMasterList(["Hilo Rojo", sHiloRojo, Power.Fire, oHiloRojo]);


display_set_gui_size(RESOLUTION_W,RESOLUTION_H);

room_goto(ROOM_START);
