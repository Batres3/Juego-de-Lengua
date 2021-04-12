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
	//Move towards new destination
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