/// @description Animate firing

if (!is_dead) {
	sprite_index = spr_enemy_shooter_cannon;
	image_index = 0;
	alarm_set(3, 40); // Create projectile
	alarm_set(2, room_speed); // Reset animation
	alarm_set(1, 3 * room_speed); // Schedule next attack
}


