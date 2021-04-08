///@desc Add an item to master list
///@param Attributes The array of attributes to add
function AddItemToMasterList(attributes){
	
	if(!is_array(attributes) or array_length(attributes) != Book.Height){ show_message ("Input Incorrect"); return;}
	
	ds_grid_resize(global.AllItems, ds_grid_width(global.AllItems) + 1, ds_grid_height(global.AllItems));
	
	for (var i = 0; i < array_length(attributes); i++){
		global.AllItems[# ds_grid_width(global.AllItems) - 1, i] = attributes [i];
	}
	
}


function ActivateLibrary(){
	state = PlayerStateLocked;
	instance_create_layer(0, 0, "Instances", oLibraryInventory);
}