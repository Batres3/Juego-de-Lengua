function PlayerStateNoHorse(){
		var _oldSprite = sprite_index;

if (xdir != 0 or ydir != 0){
	
	hSpeed = lengthdir_x(pts, dir) * speedWalk;
    vSpeed = lengthdir_y(pts, dir) * speedWalk;
	
	PlayerCollision();
	
	direction = dir;
	sprite_index = spriteRun;
}else {
	sprite_index = spriteIdle;
}
if (_oldSprite != sprite_index) localFrame = 0;

PlayerAnimateScript();

//Attack Key Logic
if (mouse_check_button_pressed(mb_left)){
	state = PlayerStateAttack;
	stateAttack = AttackSlash;
}


//Activate key logic
if(keyboard_check_pressed(vk_space)) {
	// Check for an entity to activate
	// If there is nothing, or there is something with no script, roll
	// Otherwise, there is somthing with a script, activate
	// If the thing we activate is an NPC, make it face towards us
	
	var _activateX = lengthdir_x(10, direction);
	var _activateY = lengthdir_y(10, direction);
	activate = instance_position(x+_activateX, y-8+_activateY, pEntity);
	
	if (activate == noone or activate.entityActivateScript == -1){
		state = PlayerStateRoll;
	    moveDistRemaining = distanceRoll;
	} else {
		ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
		
		if(activate.entityNPC){
			activate.direction = point_direction(x, y, other.x, other.y);
			activate.image_index = CARDINAL_DIR - 2;
		}
	}
}

}