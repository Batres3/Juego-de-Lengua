///@arg Message
///@arg Background
///@arg [Responses]
function NewTextBox(){
	var _obj;
	if(instance_exists(oText)) _obj = oTextQueued; else _obj = oText;
	
	with (instance_create_layer(0, 0, "Instances", _obj)){
		message = argument[0];
		if (instance_exists(other)) originInstance = other.id; else originInstance = noone;
		if (argument_count > 1) background = argument[1]; else background = 1;
		if (argument_count > 2){
			// Remove markers from response
			responses = argument[2];
			for (var i = 0; i < array_length_1d(responses); i++){
				var _markerPosition = string_pos(":", responses[i]);
				responseScripts[i] = string_copy(responses[i], 1, _markerPosition - 1);
				responseScripts[i] = real(responseScripts[i]);
				responses[i] = string_delete(responses[i], 1, _markerPosition);
			} 
		} else {
			responses = [-1];
			responseScripts = [-1];
		}
	} 
	
	with (oJugador) {
		if (state != PlayerStateLocked){
			lastState = state;
			state = PlayerStateLocked;
		}
		
	}
}





///@arg Response
function DialogueResponses(response) {
	switch(response){
		case 0: break;
		case 1: NewTextBox("You gave response A!", 1); break;
		case 2: NewTextBox("You gave response B! Any furhter response?", 1, ["3:Yes!", "0:No."]); break;
		case 3: NewTextBox("Thanks for your responses!", 1); break;
		default: break;
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
	var _entityList = ds_list_create();
	
    //Horizontal Tiles
	if(tilemap_get_at_pixel(collisionMap, x + hSpeed, y)){
		x -= x mod TILE_SIZE;
		if(sign(hSpeed) == 1) x += TILE_SIZE - 0.5;
		hSpeed = 0;
		_collision = true;
	}
	
	//Horizontal Entities
	var _entityCount = instance_position_list(x + hSpeed, y, pEntity, _entityList, false);
	var _snapX;
	while (_entityCount > 0){
		var _entityCheck = _entityList[| 0];
		if (_entityCheck.entityCollision == true){
			//Move as close as we can
			if (sign(hSpeed) == -1) _snapX = _entityCheck.bbox_right + 1;
			else _snapX = _entityCheck.bbox_left - 1;
			x = _snapX;
			hSpeed = 0;
			_collision = true;
			_entityCount = 0;
		}
		ds_list_delete(_entityList, 0);
		_entityCount--;
	}
	
	//Horizontal Move Commnit
	x += hSpeed;
	
	ds_list_clear(_entityList);
	
	//Vertical Tiles
	if(tilemap_get_at_pixel(collisionMap, x , y + vSpeed)){
		y -= y mod TILE_SIZE;
		if(sign(vSpeed) == 1) y += TILE_SIZE - 0.5;
		vSpeed = 0;
		_collision = true;
	}
	
	//Vartical Entities
	var _entityCount = instance_position_list(x, y + vSpeed, pEntity, _entityList, false);
	var _snapY;
	while (_entityCount > 0){
		var _entityCheck = _entityList[| 0];
		if (_entityCheck.entityCollision == true){
			//Move as close as we can
			if (sign(vSpeed) == -1) _snapY = _entityCheck.bbox_bottom + 1;
			else _snapY = _entityCheck.bbox_top - 1;
			y = _snapY;
			vSpeed = 0;
			_collision = true;
			_entityCount = 0;
		}
		ds_list_delete(_entityList, 0);
		_entityCount--;
	}
	
	//Vertical Move Commnit
	y += vSpeed;
	
	ds_list_destroy(_entityList);
	
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



// Execute an array
/// @desc execute script with argument array
/// @returns any
/// @arg script
/// @arg args[]

function ScriptExecuteArray(scr,args){
	
	switch (array_length(args)){
		
		case 1: return script_execute(scr, args[0]);
		
		case 2: return script_execute(scr, args[0], args[1]);
		
		case 3: return script_execute(scr, args[0], args[1], args[2]);
		
		case 4: return script_execute(scr, args[0], args[1], args[2], args[3]);
		
		case 5: return script_execute(scr, args[0], args[1], args[2], args[3], args[4]);
		
		case 6: return script_execute(scr, args[0], args[1], args[2], args[3], args[4], args[5]);
		
		case 7: return script_execute(scr, args[0], args[1], args[2], args[3], args[4], args[5], args[6]);
		
		case 8: return script_execute(scr, args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7]);
		
		default: show_error("script_execute_array: argument count not supported!",false);
		
	}

}