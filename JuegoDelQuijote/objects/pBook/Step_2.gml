/// @description Insert description here
// You can write your code in this editor
if (!global.gamePaused){
	depth = 0;
	if (lifted) and (instance_exists(oJugador)){
		x = oJugador.x + 3;
		y = oJugador.y - 24;
		z = 25;
		depth = oJugador.depth + 1;
	}
}