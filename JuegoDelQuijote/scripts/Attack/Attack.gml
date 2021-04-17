function PlayerStateAttack() {
	script_execute(stateAttack);
}

//Use attack hitbox and check for hits
//@arg Mask Index
function CalcAttack(mask_id, _damage, _knockback){
	mask_index = mask_id
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, pEntity, hitByAttackNow, false);
	
	if(hits > 0){
		for (var i = 0; i < hits; i++){
			//If this instance has not yet been hit by this attack, hit it
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttack, hitID) == -1){
				ds_list_add(hitByAttack, hitID);
				with (hitID){
					if(object_is_ancestor(object_index, pEnemy)){
						HurtEnemy(id, _damage, other.id, _knockback);
					} else if(entityHitScript != -1) script_execute(entityHitScript);
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
	
	CalcAttack(sPlayerAttackSlashHB, 5, 10);
	
	//Update Sprite
	PlayerAnimateScript();
	if (animationEnd){
		state = PlayerStateNoHorse;
		animationEnd = false;
	}
}

function HurtEnemy(_enemy, _damage, _source, _knockback) {
	with (_enemy){
		if (state != ENEMYSTATE.DIE){
			enemyHP -= _damage;
			flash = 1;
			
			//Hurt or dead
			if (enemyHP <= 0){
				state = ENEMYSTATE.DIE;
			} else {
			if (state != ENEMYSTATE.HURT) statePrevious = state;
			state = ENEMYSTATE.HURT;
			}
			
			image_index = 0;
			if (_knockback != 0){
				var _knockDir = point_direction(x, y, _source.x, _source.y);
				xTo = x - lengthdir_x(_knockback, _knockDir);
				yTo = y - lengthdir_y(_knockback, _knockDir);
			}
			
		}
	}
}