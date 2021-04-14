event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy sprites
sprMove = sSlime;

//Enemy Scripts
enemyScript[ENEMYSTATE.WANDER] = SlimeWander;
enemyScript[ENEMYSTATE.CHASE] = SlimeChase;