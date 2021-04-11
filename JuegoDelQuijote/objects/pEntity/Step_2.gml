/// @desc Entity Loop
if (!global.gamePaused){
	depth = 20;
	if (lifted) and (instance_exists(oJugador)){
		x = oJugador.x + 1;
		y = oJugador.y;
		z = 25;
		depth = oJugador.depth - 1;
	}
}
flash = max(flash - 0.04, 0);