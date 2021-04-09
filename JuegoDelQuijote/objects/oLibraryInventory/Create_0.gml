menuWidth = 5;
menuHeight = 6;
itemSeperationX = 17;
itemSeperationY = 21;
itemScale = 0.5;
currentItem = undefined;
showDescription = false;
sequenceDone = true;
depth = 6;
exit_ = false;

cameraX = camera_get_view_x(view_camera[0]);
cameraY = camera_get_view_y(view_camera[0]);
cameraMiddleX = camera_get_view_width(view_camera[0]) * 0.5
cameraMiddleY = camera_get_view_height(view_camera[0]) * 0.5
bottomRow = cameraMiddleY + 46;
sequence = undefined;