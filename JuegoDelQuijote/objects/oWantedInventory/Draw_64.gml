//Draw Inventory
draw_set_color(c_black);
draw_set_alpha(.75);
draw_rectangle(0, 0, room_width, room_height, false);
//Draw Inventory Back
draw_set_alpha(1);
if (test == 0){
	test++;
	if (!isShowingInfo)sequence = layer_sequence_create("InventoryDesc", 160, 90, sqDescriptionAnimation2);
}

if (keyboard_check_pressed(vk_space) and isShowingInfo){
	isShowingInfo = false;
	layer_sequence_headdir(sequence, seqdir_left);
	layer_sequence_play(sequence);
	_exit = true;
}
