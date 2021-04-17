// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateDead(){
	hSpeed = 0;
	vSpeed = 0;
	
	//if just arriving in this state
	if (sprite_index != sPlayerDie and sprite_index != sPlayerDead){
		//Update
		sprite_index = sPlayerDie;
		image_index = 0;
		image_speed = 0.7;
	}
	//Animation ending this frame
	if (image_index + image_speed > image_number){
		if (sprite_index == sPlayerDie){
			image_index = 1;
			image_speed = 0;
			NewTextBox("Oh mi querida Dulceina, al fin no pude llevarme tu amor", 1);
			NewTextBox("Pero, como tu ya sabes " + FRASESCELEBRES[3], 1);
			NewTextBox("Y cuantas te diria, mas de cien mil si tiempo tuviera, pero se sabe que " + FRASESCELEBRES[4], 1);
			NewTextBox("Por eso te dejo esto antes de irme: " + FRASESCELEBRES[5], 1)
			NewTextBox("Decide tu futuro con sabiduria, mi querida Dulceina, no como yo que me fui de este mundo sin tu amor", 1);
			NewTextBox(FRASESCELEBRES[1] + " Cuan feliz habria sido a tu lado", 1);
			} else {
			image_speed = 0;
			image_index = image_number -1;
			global.targetX = -1;
			global.targetY = -1;
			RoomTransition(TRANS_TYPE.FADE, rVillage);
			}
	}
	if (dead) {
		dead = false;
		sprite_index = sPlayerDead;
		image_index = 0;
		image_speed = 1;
	}
}