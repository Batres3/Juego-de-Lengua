state = PlayerStateNoHorse;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

speedWalk = 0.8;
speedHorse = 1.2;

spriteRun = sQuijoteSinCaballoCorriendo;
spriteIdle = sQuijoteSinCaballo;
spriteRunH = sQuijoteEnCaballo;
spriteIdleH = sQuijoteEnCaballoQuieto;
localFrame = 0;
