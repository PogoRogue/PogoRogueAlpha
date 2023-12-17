combo_decrease_speed = global.combo_max/500; //# of frames for each combo to last

if (instance_exists(obj_player)) {
	depth = obj_player.depth - 1;
}