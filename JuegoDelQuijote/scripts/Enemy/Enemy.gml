function SlimeWander() {
	sprite_index = sprMove;
	
	//At destination or given up
	if ((x == xTo) and (y == yTo)) or (timePassed > enemyWanderDistance / enemySpeed) {
		hSpeed = 0;
		vSpeed = 0;
		//End move animation
		if (image_index < 1) {
			image_speed = 0;
			image_index = 0;
		}
		
		//set new destination
		if (++wait >= waitDuration) {
			wait = 0;
			timePassed = 0;
			dir = point_direction(x, y, xstart, ystart) + irandom_range(-45, 45);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
		} 
	} else {
		//Move towards new destination
		timePassed++;
		image_speed = 1;
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		var _speedThisFrame = enemySpeed;
		if (_distanceToGo < enemySpeed) _speedThisFrame = _distanceToGo;
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(_speedThisFrame, dir);
		vSpeed = lengthdir_y(_speedThisFrame, dir);
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		
		//Collide and move
		EnemyTileCollision();
	}
	//Check for aggro
	if (++aggroCheck >= aggroCheckDuration){
		aggroCheck = 0;
		if (instance_exists(oJugador) and point_distance(x, y, oJugador.x, oJugador.y) <= enemyAggroRadius){
			state = ENEMYSTATE.CHASE;
			target = oJugador;
		}
	}
}

function SlimeChase() {
	sprite_index = sprMove;
	stompCooldown--;
	if (enemyHasDirection) EnemyAnimateScript();
	if (instance_exists(target)){
		xTo = target.x;
		yTo = target.y;
		
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		if (!enemyHasDirection)image_speed = 1;
		dir = point_direction(x, y, xTo, yTo);
		if (_distanceToGo > enemySpeed){
			hSpeed = lengthdir_x(enemySpeed, dir);
			vSpeed = lengthdir_y(enemySpeed, dir);
		} else {
			hSpeed = lengthdir_x(_distanceToGo, dir);
			vSpeed = lengthdir_y(_distanceToGo, dir);
		}
		if (hSpeed != 0 and !enemyHasDirection) image_xscale = sign(hSpeed);
		//Collide and move
		EnemyTileCollision();
	}
	
	//Check to perform an attack
	if (instance_exists(target)) and (point_distance(x, y, target.x, target.y) <= enemyAttackRadius){
		state = ENEMYSTATE.ATTACK;
		if (enemyIsSlime){
		sprite_index = sprAttack;
		image_index = 0;
		image_speed = 1.0;
		//target 8px past player
		xTo += lengthdir_x(8, dir);
		yTo += lengthdir_y(8, dir);
		}
	}
}

function WindmillWander() {
	sprite_index = sprStill;
	//Check for aggro
	if (++aggroCheck >= aggroCheckDuration){
		aggroCheck = 0;
		if (instance_exists(target) and point_distance(x, y, target.x, target.y) <= enemyAggroRadius){
			entityCollision = false;
			EnemyActOutAnimation(object_index, sSmokeExplosion, SetToChase);
		}
	}
}

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

function SlimeAttack() {
	//How fast to move
	var _spd = enemySpeed;
	
	//Dont move while getting ready to jump
	if (image_index < 2) _spd = 0;
	
	//Freeze animation while midair and after landing
	if (floor(image_index) == 3 or floor(image_index == 5)){
		image_speed = 0;
	}
	
	//How far we have to go
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	
	//begin landing once we're nearly done
	if (_distanceToGo < 4 and image_index < 5) image_speed = 1;
	
	//Move
	if (_distanceToGo > _spd) {
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(_spd,dir);
		vSpeed = lengthdir_y(_spd,dir);
		if(hSpeed != 0) image_xscale = sign(hSpeed);
		
		if(EnemyTileCollision() == true) {
			xTo = x; 
			yTo = y;
			} 
	} else {
		x = xTo; 
		y = yTo;
		if (floor(image_index) == 5){
			stateTarget = ENEMYSTATE.CHASE;
			stateWaitDuration = 15;
			state = ENEMYSTATE.WAIT;
		}
	}
}

function GiantAttack (){
	if(stompCooldown < 1){
		stompCooldown = 120;
		giantAttack = true;
		EnemyActOutAnimation(object_index, sprAttack, ScreenShakeGiant);
	} else state = ENEMYSTATE.CHASE;
}

function ScreenShakeGiant() {
	ScreenShake(6, 32);
	stateTarget = ENEMYSTATE.CHASE;
	stateWaitDuration = 15;
	state = ENEMYSTATE.WAIT;
}