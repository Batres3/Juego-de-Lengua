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
#macro FRASESCELEBRES ["En un lugar de la Mancha, de cuyo nombre no quiero acordarme, no ha mucho que vivía un hidalgo de los de lanza en astillero, adarga antigua, rocín flaco y galgo corredor", "¡Oh, memoria, enemiga mortal de mi descanso!", "Confía en el tiempo, que suele dar dulces salidas a muchas amargas dificultades"]

enum ENEMYSTATE {
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	WAIT,
	ACT
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
