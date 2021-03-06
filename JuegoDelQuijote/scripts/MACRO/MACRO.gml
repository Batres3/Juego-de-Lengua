#macro FRAME_RATE 60
#macro TILE_SIZE 16
#macro CARDINAL_DIR round(direction/90) 
#macro ROOM_START rLibreria

#macro RESOLUTION_W 320
#macro RESOLUTION_H 180

#macro TRANSITION_SPEED 0.02
#macro OUT 0
#macro IN 1

#macro LibrosQuemar "Flyte, Harry Potter, Diario de una ilusion, Hilo Rojo, Narnia, Don Quijote de la Mancha, El Lazarillo, El Principito, Crepusculo, El Conde Lucanor"
#macro LibrosSalvar "The Feynman lecturen on Physics, Genio en 21 dias, Brian Weiss, Cartas de amor al cielo, La chica que patina y el tonto que la quiere, La chica invisible, After, El Secreto, El laberinto cuantico, El psicoanalista"
#macro FRASESCELEBRES oGame.frases
#macro CosasOdiar "Es muy enrollado.\nVocabulario complejo.\nLa historia tiene poco sentido.\nLa falta de profundidad en personajes secundarios.\nEs repetitivo.\nNo me gusta la premisa.\nUsa muchos refranes.\nEs muy largo"
#macro CosasQuerer "Sirve como cultura general. Tiene historias divertidas. Es gracioso. Como se representa su locura. Los insultos. La manera en la que parodia los libros de caballeria. El desarrollo de los personajes principales. La originalidad de la historia"

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
