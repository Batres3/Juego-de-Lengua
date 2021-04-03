///@desc ScreenShake(magnitude, frames)
///@arg Magnitude sets the srength of the shake
///@arg frames sets the length of the shake
function ScreenShake(argument0, argument1){
	with (global.iCamera){
		if(argument0 > shakeRemain) {
			shakeMagnitude = argument0;
			shakeRemain = shakeMagnitude;
			shakeLength = argument1;
		}
		
	}
}
