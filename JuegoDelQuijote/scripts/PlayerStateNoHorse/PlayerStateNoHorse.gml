function PlayerStateNoHorse(){
		var _oldSprite = sprite_index;

if (xdir != 0 or ydir != 0){
	
	hSpeed = lengthdir_x(pts, dir) * speedWalk;
    vSpeed = lengthdir_y(pts, dir) * speedWalk;
	
	PlayerCollision();
	
	direction = dir;
	sprite_index = spriteRun;
}else {
	sprite_index = spriteIdle;
}
if (_oldSprite != sprite_index) localFrame = 0;

PlayerAnimateScript();

//Roll
if(state == PlayerStateNoHorse and keyboard_check_pressed(vk_space)) {
	state = PlayerStateRoll;
	moveDistRemaining = distanceRoll;
}
}
