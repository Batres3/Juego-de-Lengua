 if (sequence != undefined and layer_sequence_is_finished(sequence) and layer_sequence_get_headdir(sequence) == seqdir_right){
	isShowingInfo = true;
}

if (layer_sequence_is_finished(sequence) and _exit){
	layer_sequence_destroy(sequence);
	with (oJugador){
		state = PlayerStateNoHorse;
	}
	instance_destroy();
}