/// @description Handle death

if(is_dead) {
	image_alpha *= 0.9;
} else if (hp <= 0) {
	is_dead = true;
	alarm_set(0, room_speed);
}