var pps = 700;
var timePassed = delta_time/1000000;
var pts = pps * timePassed;

var ydir = keyboard_check(ord("S")) - keyboard_check(ord("W"));
var xdir = keyboard_check(ord("D")) - keyboard_check(ord("A"));

if (xdir != 0 or ydir != 0){
	
	var dir = point_direction(0, 0, xdir, ydir);
	
	x += lengthdir_x(pts, dir);
	y += lengthdir_y(pts ,dir);
}