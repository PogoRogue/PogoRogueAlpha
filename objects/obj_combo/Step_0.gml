if global.combo_length > 0 {
	if global.combo > 0 {
		global.combo_length -= combo_decrease_speed;
	}else {
		global.combo_length = 0;
	}
}else {
	global.combo = 0;
}