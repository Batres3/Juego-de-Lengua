//Draw Inventory
draw_set_color(c_black);
draw_set_alpha(.75);
draw_rectangle(0, 0, room_width, room_height, false);
//Draw Inventory Back
draw_set_alpha(1);
draw_sprite(sLibraryInventory, 0, cameraX + 20, cameraMiddleY);

//Items
for (var i = 0; i < ds_grid_width(global.AllItems); i++){
	var columnNow = floor(i/menuWidth);
	var itemX = cameraX + 28 + (i * itemSeperationX);
	var itemY = bottomRow - ((menuHeight-1) * itemSeperationY);
	var sprite = global.AllItems[# i, Book.Sprite];
	
	if (i >= menuWidth){
		itemX = cameraX + 28 + ((i - (menuWidth * columnNow)) * itemSeperationX);
		itemY = bottomRow - ((menuHeight - columnNow - 1) * itemSeperationY);
	}
	draw_sprite_ext(sprite, 1, itemX, itemY, itemScale, itemScale, 0, c_white, 1);
}
