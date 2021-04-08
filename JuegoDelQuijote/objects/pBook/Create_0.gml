/// @desc Master Book Object

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