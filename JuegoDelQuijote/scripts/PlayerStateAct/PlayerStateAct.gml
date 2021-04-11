// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateAct(){
	//Update Sprite
	PlayerAnimateScript();
	if(animationEnd){
		oJugador.state = global.lastState;
		animationEnd = false;
		if (animationEndScript != -1){
			script_execute(animationEndScript);
			animationEndScript = -1;
		}
	}
}