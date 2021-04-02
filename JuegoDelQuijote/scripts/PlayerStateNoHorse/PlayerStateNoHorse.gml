// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
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


}