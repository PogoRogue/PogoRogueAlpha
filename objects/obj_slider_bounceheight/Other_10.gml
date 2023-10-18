/// @description Set bounce height
custom_value = custom_min_value + ((custom_max_value-custom_min_value)*value)
custom_value = round(custom_value / custom_increment) / (1/custom_increment)
if (instance_exists(obj_player)) {
	obj_player.vsp_basicjump = -custom_value
	obj_player.basic_weapon[1] = obj_player.vsp_basicjump * 0.9
}