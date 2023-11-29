/// @description Handle death

if(is_dead) {
	image_alpha *= 0.9;
	mask_index = spr_nothing;
} else if (hp <= 0) {
	is_dead = true;
	alarm_set(0, room_speed);
	
	//screen shake
	scr_Screen_Shake(6, 10);
	
	//combo
	global.combo += 1;
	global.combo_length = global.combo_max;
	
	//create coins and items
	var center_x = x - sprite_get_xoffset(sprite_index) + ((sprite_width / 2)*image_xscale);
	var center_y = y - sprite_get_yoffset( sprite_index) + sprite_height / 2;
	with instance_create_depth(center_x,center_y,depth-1,obj_coin_spawner) {
		num_of_coins = global.combo;
	}
	
	alarm[11] = 8; //drops
}

// Update iframes
current_iframes = max(current_iframes - 1, 0);

// Update red shader frames
red_frames = max(red_frames - 1, 0);
