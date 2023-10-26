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
		gun.current_bullets = gun.bullets_per_bounce //reload bullets
	}
}

//moving and shooting
#region //gun position and angle
/*
//sprite_index = gun.sprite

//flip gun
if (mouse_x > x) {
	image_yscale = 1
}else {
	image_yscale = -1
}

//lerp angle
mouse_angle -= angle_difference(mouse_angle,point_direction(x,y,mouse_x,mouse_y)) * 0.5
knockback_angle -= angle_difference(mouse_angle,point_direction(x,y,mouse_x,mouse_y)) * 0.05

image_angle = mouse_angle + knockback_angle

//lerp position
x = lerp(x,ox,0.05)
y = lerp(y,oy,0.05)
*/
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
	
	if ((gun.current_bullets) > 0 and !bouncing) {
		scr_Shoot();
	
		var delay = gun.burst_delay;
		repeat (gun.burst_number - 1) {
			call_later(delay,time_source_units_frames,scr_Shoot);
			delay += gun.burst_delay;
		}
	}
}

if !(key_fire_projectile) { //lerp back to starting firerate while not shooting
	ammo.firerate = lerp(ammo.firerate, ammo.firerate_start, ammo.firerate_mult);
}


#endregion

//switch between weapons
if keyboard_check_pressed(ord("E")) {
	if (current_gun) < array_length(gun_array)-1 {
		current_gun += 1;
	}else {
		current_gun = 0;
	}
	
	gun = gun_array[current_gun];
}

//restart room if reached the top
if (bbox_bottom < 0 and mask_index != spr_nothing) {
	room_restart()	
}