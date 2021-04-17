if (instance_exists(oJugador)) and (position_meeting(oJugador.x, oJugador.y, id)){
	if(!instance_exists(oTransition)) and (oJugador.state != PlayerStateDead){
		global.targetRoom = targetRoom;
		global.targetX = targetX;
		global.targetY = targetY;
		global.targetDir = oJugador.direction;
		with (oJugador){ 
			global.lastState = state;
			state = PlayerStateTransition;
			}
		RoomTransition(TRANS_TYPE.SLIDE, targetRoom);
		instance_destroy();
	}
}