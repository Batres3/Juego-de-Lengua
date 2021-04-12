#macro FRAME_RATE 60
#macro TILE_SIZE 16
#macro CARDINAL_DIR round(direction/90) 
#macro ROOM_START rLibreria

#macro RESOLUTION_W 320
#macro RESOLUTION_H 180

#macro TRANSITION_SPEED 0.02
#macro OUT 0
#macro IN 1

#macro LibrosQuemar "Flyte, Harry Potter, Diario de una ilusion, Hilo Rojo"
#macro LibrosSalvar "The Feynman lecturen on Physics, Genio en 21 dias, Brian Weiss, Cartas de amor al cielo"

enum ENEMYSTATE {
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	WAIT
}

enum Power{
	Lightning,
	Wind,
	Water,
	Fire,
	Earth,
	Height
}

enum Book{
	Name,
	Sprite,
	Power,
	Object,
	Height
}

enum Type{
	Save,
	Destroy
}
