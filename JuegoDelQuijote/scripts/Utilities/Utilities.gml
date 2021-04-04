function NewTextBox(){
	var _obj;
	if(instance_exists(oText)) _obj = oTextQueued; else _obj = oText;
	
	with (instance_create_layer(0, 0, "Instances", _obj)){
		message = argument[0];
		if (instance_exists(other)) originInstance = other.id; else originInstance = noone;
		if (argument_count > 1) background = argument[1]; else background = 1;
	} 
	
	with (oJugador) {
		if (state != PlayerStateLocked){
			lastState = state;
			state = PlayerStateLocked;
		}
		
	}
}




 function PlayerAnimateScript(){
  var _totalFrames = sprite_get_number(sprite_index)/4;

  image_index = localFrame + (CARDINAL_DIR * _totalFrames) 
  localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;

  if (localFrame = _totalFrames){
  	  animationEnd = true;
  	  localFrame -= _totalFrames;

  }else animationEnd = false;
}






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





///@desc ScreenShake(magnitude, frames)
///@arg Magnitude sets the srength of the shake
///@arg frames sets the length of the shake
function ScreenShake(argument0, argument1){
	with (global.iCamera){
		if(argument0 > shakeRemain) {
			shakeMagnitude = argument0;
			shakeRemain = shakeMagnitude;
			shakeLength = argument1;
		}
		
	}
}