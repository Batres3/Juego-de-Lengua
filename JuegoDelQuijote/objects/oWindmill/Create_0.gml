event_inherited();

state = ENEMYSTATE.WANDER;
target = oJugador;
localFrame = 0;

//Enemy sprites
sprMove = sGiant;
sprStill = sWindmill;

//Enemy Scripts
enemyScript[ENEMYSTATE.WANDER] = WindmillWander;
enemyScript[ENEMYSTATE.CHASE] = SlimeChase;
enemyScript[ENEMYSTATE.ACT] = EnemyStateAct;