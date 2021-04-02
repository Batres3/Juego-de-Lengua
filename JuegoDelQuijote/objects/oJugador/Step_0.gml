pps = 70;
timePassed = delta_time/1000000;
pts = pps * timePassed;

ydir = keyboard_check(ord("S")) - keyboard_check(ord("W"));
xdir = keyboard_check(ord("D")) - keyboard_check(ord("A"));
dir = point_direction(0, 0, xdir, ydir);

//Change State
if (keyboard_check_pressed(ord("H")) and state == PlayerStateHorse) {
	state = PlayerStateNoHorse;
} else if (keyboard_check_pressed(ord("H"))) state = PlayerStateHorse;

script_execute(state);
