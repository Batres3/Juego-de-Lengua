 if (sequence != undefined and layer_sequence_is_finished(sequence) and layer_sequence_get_headdir(sequence) == seqdir_right){
	showDescription = true;
	currentItem.isShowingInfo = true;
}

 if (sequence != undefined and layer_sequence_is_finished(sequence) and layer_sequence_get_headdir(sequence) == seqdir_left){
	layer_sequence_destroy(sequence);
}
 
 
 if (keyboard_check_pressed(vk_space) and layer_sequence_is_finished(sequence)){
	with (oJugador){
	state = lastState;
	}
	instance_destroy();
}