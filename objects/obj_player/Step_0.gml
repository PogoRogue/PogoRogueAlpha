/// @description player movement

//Get inputs (1 = pressed, 0 = not pressed)
if (dead = false) {
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_fire_projectile = keyboard_check(vk_space) || mouse_check_button(mb_left)

	key_right_pressed = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_left_pressed = keyboard_check(vk_left) || keyboard_check(ord("A"));
	if use_mouse {
		key_fire_projectile_pressed = mouse_check_button_pressed(mb_left)
		key_fire_projectile_released = mouse_check_button_released(mb_left)
	}else {
		key_fire_projectile_pressed = keyboard_check_pressed(vk_space)
		key_fire_projectile_released = keyboard_check_released(vk_space)
	}
}else {
	key_right = 0
	key_left = 0
	key_fire_projectile = 0

	key_right_pressed = 0
	key_left_pressed = 0
	key_fire_projectile_pressed = 0
	key_fire_projectile_released = 0
}

//angle
if (use_mouse = false) { //use WASD/Arrow Keys to angle player
	if (angle >= -anglemax and key_right and !invert) or (angle >= -anglemax and key_left and invert){
		current_rotation_speed = -rotation_speed
	}else if (angle <= anglemax and key_left and !invert) or (angle <= anglemax and key_right and invert) {
		current_rotation_speed = rotation_speed
	}else {
		if (current_rotation_speed > 0) {
			current_rotation_speed -= rotation_delay
		}else if (current_rotation_speed < 0) {
			current_rotation_speed += rotation_delay
		}
	}
	
	angle += current_rotation_speed
}else if (dead = false) { //use mouse to angle player
	
		if invert = false {
			if (angle <= point_direction(obj_camera.x,y,mouse_x,y-mouse_sensitivity) - 90) {
				angle += ((point_direction(obj_camera.x,y,mouse_x,y-mouse_sensitivity) - 90)-angle)/mouse_reanglespeed
			}else if (angle >= point_direction(obj_camera.x,y,mouse_x,y-mouse_sensitivity) - 90) {
				angle += ((point_direction(obj_camera.x,y,mouse_x,y-mouse_sensitivity) - 90)-angle)/mouse_reanglespeed
			}
		}else{
			if (angle <= point_direction(obj_camera.x,y,obj_camera.x - (mouse_x-obj_camera.x),y-mouse_sensitivity) - 90) {
				angle += ((point_direction(obj_camera.x,y,obj_camera.x - (mouse_x-obj_camera.x),y-mouse_sensitivity) - 90)-angle)/mouse_reanglespeed
			}else if (angle >= point_direction(obj_camera.x,y,obj_camera.x - (mouse_x-obj_camera.x),y-mouse_sensitivity) - 90) {
				angle += ((point_direction(obj_camera.x,y,obj_camera.x - (mouse_x-obj_camera.x),y-mouse_sensitivity) - 90)-angle)/mouse_reanglespeed
			}
		}
			
		clamp(angle,-anglemax,anglemax) //cant tilt too far
}


image_angle = angle

//falling
if (!bouncing) {
	vspeed += grv
}

//horizontal drag
if hspeed > 0 {
	motion_add(180,h_grv)
}else if hspeed < 0 {
	motion_add(0,h_grv)
}

//check for collision with ground below

if (place_meeting(x,y+vspeed,obj_ground_oneway) and vspeed > 0 and !place_meeting(x,y-1,obj_ground_oneway)) {
	while !(place_meeting(x,y+sign(vspeed),obj_ground_oneway)) {
		y += sign(vspeed)
	}
	bouncing = true
	
	if (object_get_name(instance_place(x,y+vspeed,obj_ground_oneway).object_index) = "obj_floatingenemy") {
		instance_place(x,y+vspeed,obj_ground_oneway).being_bounced = true
	}
}
if (place_meeting(x,y+vspeed,obj_ground) and vspeed > 0) {
	while !(place_meeting(x,y+sign(vspeed),obj_ground))
	{
		y += sign(vspeed)
	}
	bouncing = true

}

//set player sprite
if (vspeed > 0 and bouncing = false) {
	//falling animation
	if (vspeed > 1.4) {
		sprite_index = falling_sprite2
	}else {
		sprite_index = falling_sprite
	}
}else
{
	sprite_index = player_sprite
}

//bouncing
if (bouncing = true) {
	speed = 0 //stop player movement while animating
	
	//animate before bouncing
	if (image_index = sprite_get_number(sprite_index)-1) {
		animation_complete = true
	}else if (animation_complete = false) {
		image_index += 1	
	}
	
	//bounce after animation is complete
	if (animation_complete) {
		speed = vsp_basicjump //bounce speed
		direction = angle - 90 //bounce angle
		image_index = 0 //reset animation to starting frame
		bouncing = false
		animation_complete = false
		projectiles_left = current_weapon[0] //reload bullets
	}
}

//projectile
if (key_fire_projectile_pressed and !current_weapon[2] and projectiles_left > 0 and !bouncing)
or (key_fire_projectile and current_weapon[2] and auto_firing and projectiles_left > 0 and !bouncing) {
	with instance_create_depth(x,y,depth+1,current_weapon[5]) { //create bullet 
		speed = other.current_weapon[4]
		direction = other.image_angle - 90
		image_angle = other.image_angle - 90
		other.flash = true
		other.alarm[3] = 3
		sprite_index = other.current_weapon[6]
		image_index = other.projectiles_left-1
	}
	
	//give player extra momentum
	if !(current_weapon[2]) {
		speed = 0 //reset momentum if not on an auto fire weapon
	}
	motion_add(angle - 90, current_weapon[1]);
	if (speed > max_speed and current_weapon[2]) { //player cant exceed a certain speed if on an auto fire weapon
		speed = max_speed
	}

	if (auto_firing) {//fire every time_between_fires amount of frames if auto fire
		auto_firing = false
		alarm[0] = current_weapon[3]
	}
	
	projectiles_left -= 1 //lower ammo count
}

//testing weapon switching
if (keyboard_check_pressed(ord("E"))) {
	if current_weapon = auto_weapon {
		current_weapon = basic_weapon
		auto_firing = current_weapon[2]
		if (projectiles_left > current_weapon[0]) {
			projectiles_left = current_weapon[0]
		}
	}else {
		current_weapon = auto_weapon
		auto_firing = current_weapon[2]
		if (projectiles_left > current_weapon[0]) {
			projectiles_left = current_weapon[0]
		}
	}
}
//if (bouncing == true && animation_complete) {
//    jump_count += 1;
//}
 
	



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
}

//testing weapon switching
if (keyboard_check_pressed(ord("E"))) {
	if current_weapon = auto_weapon {
		current_weapon = basic_weapon
		auto_firing = current_weapon[2]
		if (projectiles_left > current_weapon[0]) {
			projectiles_left = current_weapon[0]
		}
	}else {
		current_weapon = auto_weapon
		auto_firing = current_weapon[2]
		if (projectiles_left > current_weapon[0]) {
			projectiles_left = current_weapon[0]
		}
	}
}
//restart room if reached the top
if (bbox_bottom < 0 and mask_index != spr_nothing) {
	room_restart()	
}




