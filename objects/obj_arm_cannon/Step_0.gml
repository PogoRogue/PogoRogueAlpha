
#region //Get inputs (1 = pressed, 0 = not pressed)
if (dead = false) {
	key_fire_projectile = keyboard_check(vk_space) || mouse_check_button(mb_left) || gamepad_button_check(0,gp_shoulderrb);
	key_fire_projectile_pressed = keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0,gp_shoulderrb);
	key_fire_projectile_released = keyboard_check_released(vk_space) || mouse_check_button_released(mb_left) || gamepad_button_check_released(0,gp_shoulderrb);
	
}else {
	key_fire_projectile = 0;
	key_fire_projectile_pressed = 0;
	key_fire_projectile_released = 0;
}
#endregion

#region //moving and shooting
//gun position and angle

sprite_index = gun.sprite;

//flip gun
if (mouse_x > x) {
	image_yscale = 1;
}else {
	image_yscale = -1;
}

//lerp angle
mouse_angle -= angle_difference(mouse_angle,point_direction(x,y,mouse_x,mouse_y)) * 0.5;
knockback_angle -= angle_difference(mouse_angle,point_direction(x,y,mouse_x,mouse_y)) * 0.05;

image_angle = mouse_angle;// + knockback_angle;

//lerp position
x = lerp(x,obj_player_armcan.x,0.05);
y = lerp(y,obj_player_armcan.y-20,0.05);

#endregion

#region shooting

var shoot = gun.full_auto ? key_fire_projectile : key_fire_projectile_pressed;
var ammo = gun.ammo[bullet_index];

if (canshoot > 0) {
	canshoot -= 1;
}else if (shoot) {
	//reset firerate
	canshoot = ammo.firerate;
	
	//lerp firerate to end while shooting
	ammo.firerate = lerp(ammo.firerate, ammo.firerate_end, ammo.firerate_mult);
	
	if ((gun.current_bullets) > 0 and obj_player.state != obj_player.state_bouncing) {
		scr_Shoot_Arm_Cannon();
	
		var delay = gun.burst_delay;
		repeat (gun.burst_number - 1) {
			call_later(delay,time_source_units_frames,scr_Shoot_Arm_Cannon);
			delay += gun.burst_delay;
		}
		
		//decrease ammo count for spread weapons
		if gun.spread_number > 1 {
			gun.current_bullets -= 1;
		}
	}
}

if !(key_fire_projectile) { //lerp back to starting firerate while not shooting
	ammo.firerate = lerp(ammo.firerate, ammo.firerate_start, ammo.firerate_mult);
}

#endregion

//switch between weapons
if keyboard_check_pressed(ord("E")) || gamepad_button_check_released(0,gp_shoulderr) {
	if (current_gun) < array_length(gun_array)-1 {
		current_gun += 1;
	}else {
		current_gun = 0;
	}
	
	gun = gun_array[current_gun];
}

if keyboard_check_pressed(ord("Q")) || gamepad_button_check_released(0,gp_shoulderl) {
	if (current_gun) > 0 {
		current_gun -= 1;
	}else {
		current_gun = array_length(gun_array)-1;
	}
	
	gun = gun_array[current_gun];
}
