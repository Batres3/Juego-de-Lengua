state = PlayerStateNoHorse;
stateAttack = AttackSlash;
hitByAttack = -1;


collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

hSpeed = 0;
vSpeed = 0;
speedWalk = 1;
speedHorse = 1.3;
speedRoll = 1.8;
distanceRoll = 32
distanceBonk = 24;
distanceBonkHeight = 12;
speedBonk = 1.5;
z = 0;
invulnerable = 0;
flash = 0;
flashShader = shWhiteFlash;
dead = false;

animationEndScript = -1;

spriteRun = sQuijoteSinCaballoCorriendo;
spriteIdle = sQuijoteSinCaballo;
spriteRunH = sQuijoteEnCaballo;
spriteIdleH = sQuijoteEnCaballoQuieto;
spriteRoll = sRodar;
localFrame = 0;

if (global.targetX != -1){
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDir;
}