/// @description Fire projectile

if (!is_dead) {
	instance_create_layer(x, y, "Instances", obj_explode_projectile);
	alarm_set(1, 3 * room_speed);
}


