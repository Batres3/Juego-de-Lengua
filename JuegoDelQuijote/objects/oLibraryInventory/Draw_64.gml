//Draw Inventory
draw_set_color(c_black);
draw_set_alpha(.75);
draw_rectangle(0, 0, room_width, room_height, false);
//Draw Inventory Back
draw_set_alpha(1);
draw_sprite(sLibraryInventory, 0, cameraX + 20, cameraMiddleY);

//Items
for (var i = 0; i < ds_grid_width(global.AllItems); i++){
	if (global.AllItems[# i, Book.Name] != -1){
	var columnNow = floor(i/menuWidth);
	var itemX = cameraX + 28 + (i * itemSeperationX);
	var itemY = bottomRow - ((menuHeight-1) * itemSeperationY);
	var sprite = global.AllItems[# i, Book.Sprite];
	
	if (i >= menuWidth){
		itemX = cameraX + 28 + ((i - (menuWidth * columnNow)) * itemSeperationX);
		itemY = bottomRow - ((menuHeight - columnNow - 1) * itemSeperationY);
		
    }
	draw_sprite_ext(sprite, 1, itemX, itemY, itemScale, itemScale, 0, c_white, 1);
		//Check if mouse is over an item
	if (point_in_rectangle(mouse_x, mouse_y, itemX, itemY, itemX + 11, itemY + 14.5)){
	draw_set_alpha(0.25);
	draw_set_color(c_blue);
	draw_rectangle(itemX, itemY, itemX + 10.5, itemY + 14, false);
	draw_set_alpha(1);	
	
	//Clicked on an item
	if (mouse_check_button_pressed(mb_left) && !showDescription){
		sequence = layer_sequence_create("InventoryDesc", cameraMiddleX, cameraMiddleY, sqDescriptionAnimation);
		sequenceDone = false;
		
		//Show item details
		if (!instance_exists(global.AllItems[# i, Book.Object])) {
		currentItem = instance_create_layer(-32, -32, "InventoryDesc", global.AllItems[# i, Book.Object]);
		currentItem.name = global.AllItems[# i, Book.Name];
	}
	}
	}
	//Save book
	if (point_in_rectangle(mouse_x,mouse_y, cameraX + 200, cameraY + 150, cameraX + 208, cameraY + 158) and mouse_check_button_pressed(mb_left)){
		layer_sequence_headdir(sequence, seqdir_left);
		layer_sequence_play(sequence);
		instance_destroy(currentItem);
		showDescription = false;
		exit_ = true;
		//Execute Save script
	}
	
	//Destroy Book
	if (point_in_rectangle(mouse_x,mouse_y, cameraX + 220, cameraY + 150, cameraX + 228, cameraY + 158) and mouse_check_button_pressed(mb_left)){
		layer_sequence_headdir(sequence, seqdir_left);
		layer_sequence_play(sequence);
		global.AllItems[# i, Book.Name] = -1;
		instance_destroy(currentItem);
		showDescription = false;
		exit_ = true;
		return;
		//Execute Destroy script
	}
	
	//Close window
	if (point_in_rectangle(mouse_x, mouse_y, cameraX + 240, cameraY + 10, cameraX + 260, cameraY + 30) and mouse_check_button_pressed(mb_left)){
		layer_sequence_headdir(sequence, seqdir_left);
		layer_sequence_play(sequence);
		instance_destroy(currentItem);
		showDescription = false;
	}
	}
}
