// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateHorse(){
	var _oldSprite = sprite_index;

if (xdir != 0 or ydir != 0){
	
	hSpeed = lengthdir_x(pts, dir) * speedHorse;
    vSpeed = lengthdir_y(pts, dir) * speedHorse;
	
	PlayerCollision();
	
	direction = dir;
	sprite_index = spriteRunH;
}else {
	sprite_index = spriteIdleH;
}
if (_oldSprite != sprite_index) localFrame = 0;

PlayerAnimateScript();

}