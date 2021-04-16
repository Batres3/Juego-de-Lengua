event_inherited();

state = ENEMYSTATE.WANDER;
target = oJugador;
localFrame = 0;
giantAttack = false;
giantExists = false;

//Enemy sprites
sprMove = sGiant;
sprStill = sWindmill;
sprAttack = sGiantAttack;

//Enemy Scripts
enemyScript[ENEMYSTATE.WANDER] = WindmillWander;
enemyScript[ENEMYSTATE.CHASE] = SlimeChase;
enemyScript[ENEMYSTATE.ACT] = EnemyStateAct;
enemyScript[ENEMYSTATE.ATTACK] = GiantAttack;