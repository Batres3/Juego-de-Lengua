function WindmillWander() {
	sprite_index = sprStill;
	//Check for aggro
	if (++aggroCheck >= aggroCheckDuration){
		aggroCheck = 0;
		if (instance_exists(target) and point_distance(x, y, target.x, target.y) <= enemyAggroRadius and !giantExists){
			giantExists = true;
			entityCollision = false;
			EnemyActOutAnimation(id, sSmokeExplosion, SetToChase);
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
	if (hit) HurtPlayer(point_direction(x, y, oJugador.x, oJugador.y), enemyForceTouch, enemyDamage);
}

function GiantDie() {
	EnemyActOutAnimation(id, sSmokeExplosion, SetToOriginal);
}

function SetToOriginal() {
	x = xOriginal;
	y = yOriginal;
	entityCollision = true;
	enemyScript[ENEMYSTATE.DIE] = -1;
	state = ENEMYSTATE.WANDER;
}