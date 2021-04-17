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
global.booksBurnt = 0;

global.iCamera = instance_create_layer(0,0, layer, oCamera);

//All item properties
global.AllItems = ds_grid_create(0, Book.Height);

AddItemToMasterList(["The Feynman Lectures on Physics", sFeynmanLec, Power.Lightning, oFeynmanLec]);
AddItemToMasterList(["Genio en 21 dias", sGenioEn, Power.Wind, oGenioEn]);
AddItemToMasterList(["Brian Weiss", sBrianWeiss, Power.Fire, oBrianWiess]);
AddItemToMasterList(["Cartas de amor algo", sCartasAmor, Power.Earth, oCartasAmor]);
AddItemToMasterList(["Flyte", sFlyte, Power.Wind, oFlyte]);
AddItemToMasterList(["Diario de una ilusion", sDiarioDeIlusion, Power.Earth, oDiariosDeIlusion]);
AddItemToMasterList(["Harry Potter", sHarryPotter, Power.Water, oHarryPotter]);
AddItemToMasterList(["Hilo Rojo", sHiloRojo, Power.Fire, oHiloRojo]);
AddItemToMasterList(["Narnia", sNarnia, Power.Fire, oNarnia]);
AddItemToMasterList(["El Lazarillo de Tormes", sLazarillo, Power.Lightning, oLazarillo]);
AddItemToMasterList(["Don Quijote de la Mancha", sQuijote, Power.Water, oDonQuijote]);
AddItemToMasterList(["La chica invisible", sLaChicaInvisible, Power.Water, oChicaInvisible]);
AddItemToMasterList(["La chica que patina y el tonto que la quiere", sChicaQuePatina, Power.Fire, oChicaQuePatina]);
AddItemToMasterList(["After", sAfter, Power.Wind, oAfter]);
AddItemToMasterList(["El Principito", sPrincipito, Power.Wind, oPrincipito])
AddItemToMasterList(["Secreto", sSecreto, Power.Lightning, oSecreto]);

display_set_gui_size(RESOLUTION_W,RESOLUTION_H);
