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
	entityCollision = false;
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

function SlimeHurt() {
	sprite_index = sprHurt;
	var _distanceToGo = point_distance(x, y, xTo ,yTo);
	if (_distanceToGo > enemySpeed){
		image_speed = 1;
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(enemySpeed, dir);
		vSpeed = lengthdir_y(enemySpeed, dir);
		if (hSpeed != 0){
			if (enemyIsSlime)image_xscale = -sign(hSpeed);
			else image_index = (round(dir/90) * sprite_get_number(sprite_index)/4);
		}
		
		//Collide and move
		if (EnemyTileCollision()){
			xTo = x;
			yTo = y;
		}
	}else {
		x = xTo;
		y = yTo;
		if (statePrevious != ENEMYSTATE.ATTACK and statePrevious != ENEMYSTATE.ACT) state = statePrevious; else state = ENEMYSTATE.CHASE;
	}
}

function SlimeDie() {
	sprite_index = sprDie;
	image_speed = 1;
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	if (_distanceToGo > enemySpeed) {
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(enemySpeed , dir);
		vSpeed = lengthdir_y(enemySpeed, dir);
		if (hSpeed != 0) image_xscale = -sign(hSpeed)
		
		EnemyTileCollision();
	}else {
		x = xTo;
		y = yTo;
	}
	if (image_index + (sprite_get_speed(sprite_index) /game_get_speed(gamespeed_fps)) >= image_number){
		instance_destroy();
	}
}