 if (sequence != undefined and layer_sequence_is_finished(sequence) and layer_sequence_get_headdir(sequence) == seqdir_right){
	showDescription = true;
	currentItem.isShowingInfo = true;
}

 if (sequence != undefined and layer_sequence_is_finished(sequence) and layer_sequence_get_headdir(sequence) == seqdir_left){
	layer_sequence_destroy(sequence);
	sequenceDone = true;
}
 
 if (burn and sequenceDone){
	 PlayerActOutAnimation(sPlayerBurn, BurnBook);
	 global.currentItem.lifted = true;
	 instance_destroy();
 }
 
 if(exit_ and sequenceDone) {
	 with (oJugador){
 	 state = global.lastState;
	 }
	 instance_destroy();
}

 
 if (keyboard_check_pressed(vk_space) and sequenceDone and !burn){
	 with (oJugador){
 	 state = global.lastState;
	 }
	 instance_destroy();
}