combo_decrease_speed = global.combo_max/(500+global.combo_time_added); //# of frames for each combo to last

if (instance_exists(obj_player)) {
	depth = obj_player.depth - 1;
}

low_combo_meter = false;