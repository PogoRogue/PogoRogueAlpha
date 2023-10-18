/// @description Set snappiness
custom_value = custom_min_value + ((custom_max_value-custom_min_value)*value)
custom_value = round(custom_value / custom_increment) / (1/custom_increment)
if (instance_exists(obj_player)) {
	obj_player.mouse_reanglespeed = custom_value
}