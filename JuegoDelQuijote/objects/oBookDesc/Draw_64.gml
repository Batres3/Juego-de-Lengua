draw_self();
if (instance_exists(oWantedInventory) and oWantedInventory.isShowingInfo){
	draw_text_ext(camera_get_view_x(view_camera[0]) + 85, camera_get_view_y(view_camera[0]) + 25, CosasOdiar, 8, 95);
}