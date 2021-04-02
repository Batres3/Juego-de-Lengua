// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerCollision(){
	var _collision = false;
    //Horizontal Tiles
	if(tilemap_get_at_pixel(collisionMap, x + hSpeed, y)){
		x -= x mod TILE_SIZE;
		if(sign(hSpeed) == 1) x += TILE_SIZE - 0.5;
		hSpeed = 0;
		_collision = true;
	}
	
	//Horizontal Move Commnit
	x += hSpeed;
	
	//Vertical Tiles
	if(tilemap_get_at_pixel(collisionMap, x , y + vSpeed)){
		y -= y mod TILE_SIZE;
		if(sign(vSpeed) == 1) y += TILE_SIZE - 0.5;
		vSpeed = 0;
		_collision = true;
	}
	
	//Vertical Move Commnit
	y += vSpeed;
	
	
	return _collision;

}