/// @description Fire projectile

if (!is_dead) {
	instance_create_layer(x, y, "Instances", obj_enemy_projectile_lob);
	alarm_set(1, 3 * room_speed);
}


