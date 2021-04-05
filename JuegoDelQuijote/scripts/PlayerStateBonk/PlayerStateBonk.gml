function PlayerStateBonk(){
	hSpeed = lengthdir_x(speedBonk, direction - 180) * speedBonk;
	vSpeed = lengthdir_y(speedBonk, direction - 180) * speedBonk;
	
	moveDistRemaining = max(0, moveDistRemaining - speedBonk);
	var _collided = PlayerCollision();
	
	//Update Sprite
	sprite_index = sPlayerHurt;
	image_index = CARDINAL_DIR;
	
	//Change Height
	z = sin(((moveDistRemaining / distanceBonk) * pi)) * distanceBonkHeight;
	
	//Change State
	if (moveDistRemaining <= 0){
		state = PlayerStateNoHorse;
	}
}