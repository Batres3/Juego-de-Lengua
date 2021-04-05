function PlayerStateAttack(){
	script_execute(stateAttack);
}


function AttackSlash() {
	if (sprite_index != sPlayerAttackSlash){
		sprite_index = sPlayerAttackSlash
		localFrame = 0
		image_index = 0;
	}
	
	//Update Sprite
	PlayerAnimateScript();
	if (animationEnd){
		state = PlayerStateNoHorse;
		animationEnd = false;
	}
}