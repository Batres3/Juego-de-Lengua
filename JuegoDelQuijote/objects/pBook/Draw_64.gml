/// @description Insert description here
// You can write your code in this editor


//Info for displaying description
if(isShowingInfo){
	draw_set_font(fText);
	draw_set_color(c_black);
	draw_text_ext(camera_get_view_x(view_camera[0]) + 175, camera_get_view_y(view_camera[0]) + 15, name, 10, 80);
	draw_set_font(fTextSmall);
	draw_set_color(c_blue);
	draw_text_ext(camera_get_view_x(view_camera[0]) + 175, camera_get_view_y(view_camera[0]) + 55, description, 10, 80);
	draw_sprite(sBotonSalvar, 0,camera_get_view_x(view_camera[0]) + 200, camera_get_view_y(view_camera[0]) + 150);
	draw_sprite(sBotonQuemar, 0,camera_get_view_x(view_camera[0]) + 220, camera_get_view_y(view_camera[0]) + 150);
}