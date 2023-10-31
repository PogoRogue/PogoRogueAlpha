/// @description player movement

#region //Get inputs (1 = pressed, 0 = not pressed)
if (dead = false) {
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D")) || gamepad_axis_value(0,gp_axislh) > 0.5;
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_axis_value(0,gp_axislh) < -0.5;
	key_fire_projectile = keyboard_check(vk_space) || mouse_check_button(mb_left) || gamepad_button_check(0,gp_shoulderrb);

	key_right_pressed = keyboard_check(vk_right) || keyboard_check(ord("D")) || gamepad_axis_value(0,gp_axislh) > 0.5;
	key_left_pressed = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_axis_value(0,gp_axislh) < -0.5;
	if use_mouse {
		key_fire_projectile_pressed = mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0,gp_shoulderrb);
		key_fire_projectile_released = mouse_check_button_released(mb_left) || gamepad_button_check_released(0,gp_shoulderrb);
	}else {
		key_fire_projectile_pressed = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0,gp_shoulderrb);
		key_fire_projectile_released = keyboard_check_released(vk_space) || gamepad_button_check_released(0,gp_shoulderrb);
	}
}else {
	key_right = 0;
	key_left = 0;
	key_fire_projectile = 0;
	key_right_pressed = 0;
	key_left_pressed = 0;
	key_fire_projectile_pressed = 0;
	key_fire_projectile_released = 0;
}
#endregion

//run state machine
state();

#region //angling
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
			
		clamp(angle,-anglemax,anglemax); //cant tilt too far
}


image_angle = angle;
#endregion

gun = arm_cannon.gun;

/*
if (jump_count % 20 == 0 && jump_count > 0) {
    var _trigger_chance = irandom_range(1, 100);
	jump_count = 0 ;
    if (_trigger_chance <= 20) {
        // if buff active
        speed += 3;
        current_weapon[0] = current_weapon[0] + 4;
        projectiles_left = current_weapon[0];
		buff_active = true; 
		alarm[1] = buff_duration; 
    }
}

if (shoot_count % 20 == 0 && shoot_count > 0) {
    var _triggerchance = irandom_range(1, 100);
	shoot_count = 0 ;
    if (_triggerchance <= 10) {
        // if buff active
        speed += 3;
        current_weapon[0] = current_weapon[0] + 4;
        projectiles_left = current_weapon[0];
		buff_active = true; 
		alarm[1] = buff_duration; 
    }
} */