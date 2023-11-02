/// @description Fire projectile

if (!is_dead) {
	instance_create_layer(x, y, "Instances", obj_enemy_projectile_lob);
	sprite_index = spr_enemy_shooter_cannon;
	alarm_set(2, 12);
	alarm_set(1, 3 * room_speed);
}


