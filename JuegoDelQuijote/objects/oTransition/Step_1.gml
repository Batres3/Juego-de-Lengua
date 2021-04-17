 ///@desc

with(oJugador){
	if (state != PlayerStateDead) state = PlayerStateTransition;
}	
if (percent > 0.2) global.showHealth = true;
if (leading == OUT){
	percent = min(1, percent + TRANSITION_SPEED);
	if (percent >= 1){
		room_goto(target);
		leading = IN;
	}
} else{
	percent = max(0, percent - TRANSITION_SPEED);
	if (percent <= 0){
		with (oJugador) {
			if (state != PlayerStateNoHorse and state != PlayerStateHorse) state = PlayerStateNoHorse;
			else state = global.lastState;
			draw_set_alpha(1);
		}
		instance_destroy();
	}
}