if (state == ENEMYSTATE.ATTACK){
	if (enemyIsSlime) HurtPlayer(point_direction(x, y, oJugador.x, oJugador.y), enemyForceTouch, enemyDamage);
	hit = true;
}