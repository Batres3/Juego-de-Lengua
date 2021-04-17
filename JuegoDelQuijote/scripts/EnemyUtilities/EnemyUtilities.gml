function EnemyTileCollision() {
	var _collision = false;
	if (tilemap_get_at_pixel(collisionMap, x + hSpeed, y)) {
		x -= x mod TILE_SIZE
		if (sign(hSpeed) == 1) x += TILE_SIZE - 0.5
		hSpeed = 0;
		_collision = true;
	}
	x += hSpeed;
	
	if(tilemap_get_at_pixel(collisionMap, x , y + vSpeed)){
		y -= y mod TILE_SIZE;
		if(sign(vSpeed) == 1) y += TILE_SIZE - 0.5;
		vSpeed = 0;
		_collision = true;
	}
	y += vSpeed;
	
	return _collision;
}

function EnemyStateAct() {
	EnemyAnimateScript();
	if(animationEnd){
		if (!giantAttack) state = ENEMYSTATE.WANDER;
		animationEnd = false;
		if (animationEndScript != -1){
			script_execute(animationEndScript);
			animationEndScript = -1;
		}
	}
}

function EnemyActOutAnimation(objectid, sprite, EndScript){
	objectid.state = ENEMYSTATE.ACT;
	objectid.sprite_index = sprite;
	if (argument_count > 1) objectid.animationEndScript = EndScript;
	objectid.localFrame = 0;
	objectid.image_index = 0;
}

function EnemyAnimateScript() {
	var _totalFrames = sprite_get_number(sprite_index)/4;

	image_index = localFrame + (round(dir/90) * _totalFrames);
	localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;

	if (localFrame >= _totalFrames){
  		animationEnd = true;
  		localFrame -= _totalFrames;

	}else animationEnd = false;
}

function SetToChase() {
	state = ENEMYSTATE.CHASE;
}

function EnemyWait() {
	if (++stateWait >= stateWaitDuration){
		stateWait = 0;
		state = stateTarget;
	}
}
