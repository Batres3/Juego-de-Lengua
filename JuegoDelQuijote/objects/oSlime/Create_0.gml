event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy sprites
sprMove = sSlime;
sprAttack = sSlimeAttack;

//Enemy Scripts
enemyScript[ENEMYSTATE.WANDER] = SlimeWander;
enemyScript[ENEMYSTATE.CHASE] = SlimeChase;
enemyScript[ENEMYSTATE.ATTACK] = SlimeAttack;