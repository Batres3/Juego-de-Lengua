pps = 100;
timePassed = delta_time/1000000;
pts = pps * timePassed;

var ydir = keyboard_check(ord("S")) - keyboard_check(ord("W"));
var xdir = keyboard_check(ord("D")) - keyboard_check(ord("A"));

var _oldSprite = sprite_index;

if (xdir != 0 or ydir != 0){
	
	var dir = point_direction(0, 0, xdir, ydir);
	hSpeed = lengthdir_x(pts, dir);
    vSpeed = lengthdir_y(pts, dir);
	
	PlayerCollision();
	
	direction = dir;
	sprite_index = spriteRun;
}else {
	sprite_index = spriteIdle;
}
if (_oldSprite != sprite_index) localFrame = 0;

PlayerAnimateScript();

//x += lengthdir_x(pts, dir);
//y += lengthdir_y(pts ,dir);