function EntityHitDestroy(){
	instance_destroy();
}


function EntityHitSolid(){
	flash = 0.5;
}


///@arg id
function ActivateLiftable(id){
	if(global.iLifted == noone){
		global.iLifted = id;
		with (global.iLifted){
			lifted = true;
			persistent = true;
		}
	}
}

function BurnBook(){
	instance_destroy(global.currentItem);
	global.currentItem = noone;
}