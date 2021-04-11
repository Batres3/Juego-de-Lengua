///@desc

with(oJugador){
	state = PlayerStateTransition;
}	

if (leading == OUT){
	percent = min(1, percent + TRANSITION_SPEED);
	if (percent >= 1){
		room_goto(target);
		leading = IN;
	}
} else{
	percent = max(0, percent - TRANSITION_SPEED);
	if (percent <= 0){
		with (oJugador) state = global.lastState;
		instance_destroy();
	}
}