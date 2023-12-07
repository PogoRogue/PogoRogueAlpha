/// @description Handle death

if(is_dead) {
	image_alpha *= 0.9;
	// mask_index = spr_nothing;
} else if (hp <= 0) {
	is_dead = true;
	alarm_set(0, room_speed);
	
	//screen shake
	scr_Screen_Shake(6, 10);
	
	//combo
	global.combo += 1;
	global.combo_length = global.combo_max;
	
	alarm[11] = 8; //drops
}

// Update iframes
current_iframes = max(current_iframes - 1, 0);

// Update red shader frames
red_frames = max(red_frames - 1, 0);
