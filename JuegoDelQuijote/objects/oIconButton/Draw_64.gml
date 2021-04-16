draw_self();

draw_text_ext(x, y, Text, 12, 190)
if (point_in_rectangle(mouse_x, mouse_y, x, y, x + 190, y + 49) and (mouse_check_button_pressed(mb_left))){
	room_goto(rLibreria);
}