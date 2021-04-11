 if (sequence != undefined and layer_sequence_is_finished(sequence) and layer_sequence_get_headdir(sequence) == seqdir_right){
	showDescription = true;
	currentItem.isShowingInfo = true;
}

 if (sequence != undefined and layer_sequence_is_finished(sequence) and layer_sequence_get_headdir(sequence) == seqdir_left){
	layer_sequence_destroy(sequence);
	sequenceDone = true;
}
 
 if(exit_ and sequenceDone) {
	 if (oJugador.state == PlayerStateAct){
		 instance_destroy();
	 } else {
	 with (oJugador){
 	 state = global.lastState;
	 }
	 instance_destroy();
	 }
}
 
 if (keyboard_check_pressed(vk_space) and sequenceDone){
	  if (oJugador.state == PlayerStateAct){
		 instance_destroy();
	 } else {
	 with (oJugador){
 	 state = global.lastState;
	 }
	 instance_destroy();
	 }
}