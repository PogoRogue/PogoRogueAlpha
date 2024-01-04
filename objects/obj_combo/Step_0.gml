if global.combo_length > 0 {
	if global.combo > 0 {
		global.combo_length -= combo_decrease_speed;
	}else {
		global.combo_length = 0;
	}
}else {
	global.combo = 0;
}

if global.combo_length <= global.combo_max/4 {
	low_combo_meter = true;
}else {
	low_combo_meter = false;
}

combo_decrease_speed = global.combo_max/(500+global.combo_time_added); //# of frames for each combo to last