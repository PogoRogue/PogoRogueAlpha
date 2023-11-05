/// @desc scr_Screen_Shake(magnitude,frames)
///@arg Magnitude sets the strength of the shake (distance range)
///@arg Frames sets the length of the shake in frames (60 = 1 second)
function scr_Screen_Shake(magnitude, frames) {
	
	with (obj_camera) {
		if (magnitude > shake_remain) {
			shake_magnitude = magnitude;
			shake_remain = magnitude;
			shake_length = frames;
		}
	}
}