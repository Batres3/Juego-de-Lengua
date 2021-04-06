function PlayerStateAttack(){
	script_execute(stateAttack);
}

//Use attack hitbox and check for hits
//@arg Mask Index
function CalcAttack(mask_index){
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, pEntity, hitByAttackNow, false);
	
	if(hits > 0){
		for (var i = 0; i < hits; i++){
			//If this instance has not yet been hit by this attack, hit it
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttack, hitID) == -1){
				ds_list_add(hitByAttack, hitID);
				with (hitID){
					if(entityHitScript != -1) script_execute(entityHitScript);
				}
			}
		}
	}
	ds_list_destroy(hitByAttackNow);
	mask_index = sQuijoteSinCaballo;
}



function AttackSlash() {
	// Attack just started
	if (sprite_index != sPlayerAttackSlash){
		//Start animation
		sprite_index = sPlayerAttackSlash
		localFrame = 0
		image_index = 0;
		
		//Clear hit list
		if(!ds_exists(hitByAttack, ds_type_list)) hitByAttack = ds_list_create();
		ds_list_clear(hitByAttack);
	}
	
	CalcAttack(sPlayerAttackSlashHB);
	
	//Update Sprite
	PlayerAnimateScript();
	if (animationEnd){
		state = PlayerStateNoHorse;
		animationEnd = false;
	}
}