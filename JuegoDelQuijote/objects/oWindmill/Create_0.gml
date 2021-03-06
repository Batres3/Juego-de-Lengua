event_inherited();

state = ENEMYSTATE.WANDER;
target = oJugador;
localFrame = 0;
giantAttack = false;
giantExists = false;
xOriginal = x;
yOriginal = y;

//Enemy sprites
sprMove = sGiant;
sprStill = sWindmill;
sprAttack = sGiantAttack;
sprHurt = sGiantHurt;

//Enemy Scripts
enemyScript[ENEMYSTATE.WANDER] = WindmillWander;
enemyScript[ENEMYSTATE.CHASE] = SlimeChase;
enemyScript[ENEMYSTATE.ACT] = EnemyStateAct;
enemyScript[ENEMYSTATE.ATTACK] = GiantAttack;
enemyScript[ENEMYSTATE.HURT] = SlimeHurt;
enemyScript[ENEMYSTATE.DIE] = GiantDie;