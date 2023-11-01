/// @description Handle death

if(is_dead) {
	image_alpha *= 0.9;
} else if (hp <= 0) {
	is_dead = true;
	alarm_set(0, room_speed);
}

// Update iframes
current_i_frames = max(current_i_frames - 1, 0);

// Update red shader frames
red_frames = max(red_frames - 1, 0);
