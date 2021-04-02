// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateRoll(){
	hSpeed = lengthdir_x(speedRoll, direction) * speedRoll;
	vSpeed = lengthdir_y(speedRoll, direction) * speedRoll;
	
	moveDistRemaining = max(0, moveDistRemaining - speedRoll);
	var _collided = PlayerCollision();
	
	//Update Sprite
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index)/4;
	image_index = (CARDINAL_DIR * _totalFrames) + min(((1 - (moveDistRemaining / distanceRoll)) * _totalFrames), _totalFrames - 1);
	
	//Change State
	if (moveDistRemaining <= 0){
		state = PlayerStateNoHorse;
	}
	
	
}