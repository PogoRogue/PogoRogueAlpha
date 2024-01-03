/// @description player movement

#region //Get inputs (1 = pressed, 0 = not pressed)
if (dead = false) {
	key_right = global.key_right_player;
	key_left = global.key_left_player;
	key_fire_projectile = global.key_fire_projectile;

	key_right_pressed = global.key_right_pressed_player;
	key_left_pressed = global.key_left_pressed_player;
	
	key_recenter = global.key_recenter;
	
	if use_mouse {
		key_fire_projectile_pressed = global.key_fire_projectile_pressed;
		key_fire_projectile_released = global.key_fire_projectile_released;
	}else {
		key_fire_projectile_pressed = global.key_fire_projectile_pressed;
		key_fire_projectile_released = global.key_fire_projectile_released;
	}
	key_pickup_1 = global.key_pickup_1;
	key_pickup_2 = global.key_pickup_2;
	key_pickup_1_pressed = global.key_pickup_1_pressed;
	key_pickup_2_pressed = global.key_pickup_2_pressed;
}else {
	key_right = 0;
	key_left = 0;
	key_fire_projectile = 0;
	key_right_pressed = 0;
	key_left_pressed = 0;
	key_recenter = 0;
	key_fire_projectile_pressed = 0;
	key_fire_projectile_released = 0;
	key_pickup_1 = 0;
	key_pickup_2 = 0;
}
#endregion

//land on and damage enemy
var condition = ground_pound_slam = false;
scr_Enemy_Collision_Check(condition);

//shop
if room = room_shop {
	state = state_shop;
}

//run state machine
state();

#region //pickups

//call pickups
if room != room_shop {
	if pickups_array[0].on_cooldown = false and pickups_array[0].reload_on_bounce = false { //cooldown
		if (key_pickup_1) and scr_In_Array(pickups_array[0].states_to_call_in, state) and pickups_array[0].key_held 
		or (key_pickup_1_pressed) and scr_In_Array(pickups_array[0].states_to_call_in, state) and !pickups_array[0].key_held {
			pickups_array[0].on_call();
		}
	}else if pickups_array[0].reload_on_bounce = true and pickups_array[0].uses_per_bounce > 0 { //no cooldown
		if (key_pickup_1) and scr_In_Array(pickups_array[0].states_to_call_in, state) and pickups_array[0].key_held 
		or (key_pickup_1_pressed) and scr_In_Array(pickups_array[0].states_to_call_in, state) and !pickups_array[0].key_held {
			pickups_array[0].on_call();
		}
	}
	
	//call pickup 2
	if pickups_array[1].on_cooldown = false and pickups_array[1].reload_on_bounce = false { //cooldown
		if (key_pickup_2) and scr_In_Array(pickups_array[1].states_to_call_in, state) and pickups_array[1].key_held 
		or (key_pickup_2_pressed) and scr_In_Array(pickups_array[1].states_to_call_in, state) and !pickups_array[1].key_held {
			pickups_array[1].on_call();
		}
	}else if pickups_array[1].reload_on_bounce = true and pickups_array[1].uses_per_bounce > 0 { //no cooldown
		if (key_pickup_2) and scr_In_Array(pickups_array[1].states_to_call_in, state) and pickups_array[1].key_held 
		or (key_pickup_2_pressed) and scr_In_Array(pickups_array[1].states_to_call_in, state) and !pickups_array[1].key_held {
			pickups_array[1].on_call();
		}
	}
}

//cooldowns
for (i = 0; i <= 1; i++) {
	if pickups_array[i].reload_on_bounce = false {
		if pickups_array[i].on_cooldown and pickups_array[i].cooldown_time > 0 {
			pickups_array[i].cooldown_time -= 1;
		}else if pickups_array[i].on_cooldown {
			pickups_array[i].on_cooldown = false;
			pickups_array[i].cooldown_time = pickups_array[i].max_cooldown_time;
		}
	}
}

#endregion

//reset ground pound variables
if state != state_groundpound {
	ground_pound_slam = false;
	//can_shoot = true;
	slam_speed = 12;
	slam_trail_distance = 0;
}

//stop sounds
if audio_is_playing(snd_jetpack){
	var not_jetpack_button_1 = !(key_pickup_1 and pickups_array[0] = pickup_jetpack);
	var not_jetpack_button_2 = !(key_pickup_2 and pickups_array[1] = pickup_jetpack);
	if not_jetpack_button_1 and not_jetpack_button_2 {
		audio_stop_sound(snd_jetpack);
	}
}	


#region //angling
if (can_rotate) {
	if (use_mouse = false) { //use WASD/Arrow Keys to angle player
		if (angle >= -anglemax and key_right and !invert) and !(msk_index.colliding_with_ground_right)
		or (angle >= -anglemax and key_left and invert) and !(msk_index.colliding_with_ground_left) {
			current_rotation_speed = -rotation_speed;
		}else if (angle <= anglemax and key_left and !invert) and !(msk_index.colliding_with_ground_left) 
		or (angle <= anglemax and key_right and invert) and !(msk_index.colliding_with_ground_right) {
			current_rotation_speed = rotation_speed;
		}else {
			if (current_rotation_speed > 0) {
				current_rotation_speed -= rotation_delay;
			}else if (current_rotation_speed < 0) {
				current_rotation_speed += rotation_delay;
			}
		}
		angle += current_rotation_speed;
	
		if hspeed > 0.5 {
			image_xscale = 1;
		}else if hspeed < -0.5 {
			image_xscale = -1;
		}
	
	}else if (dead = false) { //use mouse to angle player
	
			if invert = false {
				if (angle <= point_direction(obj_camera.x,y,mouse_x,y-mouse_sensitivity) - 90) {
					angle += ((point_direction(obj_camera.x,y,mouse_x,y-mouse_sensitivity) - 90)-angle)/mouse_reanglespeed;
				}else if (angle >= point_direction(obj_camera.x,y,mouse_x,y-mouse_sensitivity) - 90) {
					angle += ((point_direction(obj_camera.x,y,mouse_x,y-mouse_sensitivity) - 90)-angle)/mouse_reanglespeed;
				}
			}else{
				if (angle <= point_direction(obj_camera.x,y,obj_camera.x - (mouse_x-obj_camera.x),y-mouse_sensitivity) - 90) {
					angle += ((point_direction(obj_camera.x,y,obj_camera.x - (mouse_x-obj_camera.x),y-mouse_sensitivity) - 90)-angle)/mouse_reanglespeed;
				}else if (angle >= point_direction(obj_camera.x,y,obj_camera.x - (mouse_x-obj_camera.x),y-mouse_sensitivity) - 90) {
					angle += ((point_direction(obj_camera.x,y,obj_camera.x - (mouse_x-obj_camera.x),y-mouse_sensitivity) - 90)-angle)/mouse_reanglespeed;
				}
			}
	}
}
angle = clamp(angle,-anglemax,anglemax); //cant tilt too far

image_angle = angle;
#endregion

//recentering
if key_recenter and centering = false and angle != 0 {
	centering = true;
}

if centering = true {
	can_rotate = false;
	if angle >= rotation_speed or angle <= -rotation_speed {
		angle += rotation_speed * -sign(angle);
	}else {
		angle = 0;
		can_rotate = true;
		centering = false;
	}
	
	//stop if right or left key
	if key_left or key_right or state = state_bouncing {
		can_rotate = true;
		centering = false;
	}
}

#region shooting

if can_shoot = true and room != room_shop { 
	var shoot = gun.full_auto ? key_fire_projectile : key_fire_projectile_pressed;
	if gun = laser_gun and !instance_exists(obj_laser) { //special conditions for laser gun
		shoot = key_fire_projectile;
	}
	if key_fire_projectile_pressed and gun.current_bullets <= 0 {
		audio_play_sound(snd_outofammo,0,false);
	}
}else {
	var shoot = 0;
}
var ammo = gun.ammo[bullet_index];
//ammo += max_ammo_increase;// increase ammo by max ammo increase if players has collected max ammo buffs

if (canshoot > 0) {
	canshoot -= 1;
}else if (shoot) {
	//reset firerate
	canshoot = ammo.firerate;
	
	//lerp firerate to end while shooting
	ammo.firerate = lerp(ammo.firerate, ammo.firerate_end, ammo.firerate_mult);
	
	if ((gun.current_bullets) > 0 and state != state_bouncing and state != state_chargejump) {
		scr_Shoot();
	
		var delay = gun.burst_delay;
		repeat (gun.burst_number - 1) {
			call_later(delay,time_source_units_frames,scr_Shoot);
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
if global.key_weapon_up {
	if (current_gun) < weapons_equipped-1 {
		current_gun += 1;
	}else {
		current_gun = 0;
	}
	
	gun = gun_array[current_gun];
}

if global.key_weapon_down {
	if (current_gun) > 0 {
		current_gun -= 1;
	}else {
		current_gun = weapons_equipped-1;
	}
	
	gun = gun_array[current_gun];
}

//number keys
if global.key_weapon_1 {
	current_gun = 0;
	gun = gun_array[current_gun];
}else if global.key_weapon_2 and weapons_equipped > 1 {
	current_gun = 1;
	gun = gun_array[current_gun];
}
else if global.key_weapon_3 and weapons_equipped > 2 {
	current_gun = 2;
	gun = gun_array[current_gun];
}

if gun_2 = gun_1 {
	weapons_equipped = 1;	
}else if gun_2 != gun_1 and gun_3 = gun_1 or gun_2 != gun_1 and gun_3 = gun_2 {
	weapons_equipped = 2;	
}else if gun_2 != gun_1 and gun_3 != gun_1 and gun_3 != gun_2 {
	weapons_equipped = 3;
}



// Update iframes
current_iframes = max(current_iframes - 1, 0);

// Handle death
dead = hp <= 0;
if(dead && current_iframes <= 0) {
	game_restart(); // TODO: Handle death screen or whatever we want to do	
}