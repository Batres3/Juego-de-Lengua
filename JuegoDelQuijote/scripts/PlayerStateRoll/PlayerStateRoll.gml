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
	
	if(_collided){
		state = PlayerStateNoHorse;
		ScreenShake(4, 16);
	}
	
}