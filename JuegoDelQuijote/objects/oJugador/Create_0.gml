state = PlayerStateNoHorse;
stateAttack = AttackSlash;
lastState = state;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

speedWalk = 1;
speedHorse = 1.3;
speedRoll = 1.8;
distanceRoll = 32
distanceBonk = 24;
distanceBonkHeight = 12;
speedBonk = 1.5;
z = 0;

spriteRun = sQuijoteSinCaballoCorriendo;
spriteIdle = sQuijoteSinCaballo;
spriteRunH = sQuijoteEnCaballo;
spriteIdleH = sQuijoteEnCaballoQuieto;
spriteRoll = sRodar;
localFrame = 0;