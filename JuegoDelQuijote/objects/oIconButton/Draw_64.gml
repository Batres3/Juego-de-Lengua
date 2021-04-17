draw_self();

draw_set_font(fText);
draw_set_color(c_white);
draw_text_transformed(x + 45, y, Text, 3, 3, 0);
if (point_in_rectangle(mouse_x, mouse_y, x, y, x + 190, y + 49) and (mouse_check_button_pressed(mb_left))){
	pressed = true;
}

if (pressed){
	if(++image_index = 8) {
		pressed = false;
		RoomTransition(TRANS_TYPE.SLIDE, ROOM_START);
	}
}