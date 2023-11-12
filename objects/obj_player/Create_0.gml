/// @description initialize variables

//movement stats
grv = 0.21; //gravity
h_grv = 0.01; //horizontal drag
rotation_speed = 3; //rotation speed
current_rotation_speed = 0;
rotation_delay = rotation_speed / 7; //0.5
vsp_basicjump = -6.6; //bounce height
angle = 0;
anglemax = 40; //maximum degrees added on either side
bouncing = false; //bouncing animation when true
animation_complete = false; //bounce animation before jumping
use_mouse = false; //use mouse to control instead of WASD/Arrow keys?
mouse_sensitivity = 150; //the lower the value, the more sensitive the player is to mouse movement and vice versa
mouse_reanglespeed = 4; //the lower the value, the faster the player will reangle itself and vice versa
invert = false;
free = true; //pogo not colliding with wall, this variable ensures the player doesn't get stuck in walls
conveyor_speed = 0;
can_rotate = true;
can_shoot = true;

//pickups
charge = 0;
charge_max = vsp_basicjump;
slower_than_max = false; //ammo momentum for super jump
current_max = 0;
ground_pound_rise = false;
ground_pound_distance_risen = 0;
ground_pound_slam = false;
slam_speed = 12;
slam_trail_distance = 0;

//set controls variables
key_right = 0;
key_left = 0;
key_fire_projectile = 0;
key_right_pressed = 0;
key_left_pressed = 0;
key_fire_projectile_pressed = 0;
key_pickup_1 = 0;
key_pickup_2 = 0;
key_pickup_1_pressed = 0;
key_pickup_2_pressed = 0;

//player sprite
player_sprite = spr_player_zekai;
falling_sprite = spr_player_zekai_falling;
falling_sprite2 = spr_player_zekai_falling;

// Stats
hp = 24;
max_hp = 24;
stomp_damage = 8;
num_iframes = room_speed;
current_iframes = 0;
dead = false;

image_speed = 0;

depth = -10;

if (global.arm_cannon = true) {
	instance_destroy();
}

//we probably want 2 separate collision masks, one for the very bottom of the pogo stick, and the other for colliding with the sides/bottom of walls
with (instance_create_depth(x,y,depth-1,obj_player_mask)) {
	parent_index = other;
}
msk_index = instance_nearest(x,y,obj_player_mask); //references obj_playermask object

//item Code
has_item = false; // // Whether the player is equipped with a weapon
equipped_item = noone; // The weapon that initializes the equipment is none

#region //STATES

state_free = function() {
	
	can_rotate = true;
	can_shoot = true;
	
	vspeed += grv; //falling
	vsp_basicjump = -6.6;
	
	//horizontal drag
	if hspeed > 0 {
		motion_add(180,h_grv);
	}else if hspeed < 0 {
		motion_add(0,h_grv);
	}
	
	//check for collision with one way ground
	if (place_meeting(x,y+vspeed,obj_ground_oneway) and !place_meeting(x,y-1,obj_ground_oneway)) and vspeed > 0 {
		while !(place_meeting(x,y+sign(vspeed),obj_ground_oneway)) {
			y += sign(vspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
	}
	
	//check for collision with ground x axis
	if (place_meeting(x+hspeed,y,obj_ground)) and free = true {
		while !(place_meeting(x+sign(hspeed),y,obj_ground)) {
			x += sign(hspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
	}
	
	//check for collision with ground y axis
	if (place_meeting(x,y+vspeed,obj_ground)) and free = true {
		while !(place_meeting(x,y+sign(vspeed),obj_ground)) {
			y += sign(vspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
	}
	
	//make sure player isn't colliding with anything before checking for collisions again
	if !(place_meeting(x+hspeed,y+vspeed,obj_ground)) and free = false {
		free = true;	
	}
	
	//falling animation
	sprite_index = falling_sprite;
	
	if (vspeed > 3) {
		image_index = 3;
	}else if (vspeed > 2) {
		image_index = 2;
	}else if (vspeed > 1) {
		image_index = 1;
	}else {
		image_index = 0;
	}
	
	//restart room if reached the top
	if (bbox_bottom < 0 and mask_index != spr_nothing) {
		room_restart();
	}
	
	//ground pound
	if (key_pickup_2_pressed) {
		state = state_groundpound;	
		ground_pound_rise = true;
		ground_pound_slam = false;
		ground_pound_distance_risen = 0;
	}
}

state_bouncing = function() {
	
	can_rotate = true;
	can_shoot = true;
	free = false;
	sprite_index = player_sprite; //set sprite
	
	//animate before bouncing
	if (image_index = sprite_get_number(sprite_index)-1) {
		animation_complete = true;
	}else if (animation_complete = false) {
		image_index += 1;
	}
	
	// Conveyor belt handling
	scr_Conveyor_Belt();
	
	//bounce after animation is complete
	if (animation_complete and !key_pickup_1) {
		scr_Jump(0);
	}else if (animation_complete) {
		state = state_charging;
	}
}

state_charging = function() {
	
	// Conveyor belt handling
	scr_Conveyor_Belt();
	
	if !(key_pickup_1) {
		scr_Screen_Shake((charge/charge_max)*(-vsp_basicjump - 2)+(-2 + (-vsp_basicjump)),(charge/charge_max)*10+5)
		scr_Jump(charge);
	}else {
		if (charge > charge_max) {
			charge += charge_max/80; //80 = how many frames until max charge
		}
	}
	
}

state_groundpound = function() {
	hspeed = hspeed * 0.9;
	can_shoot = false;
	if slam_speed < 15.9 { //15.9 because dont wanna glitch through 16px platforms
		slam_speed += 0.1;
	}
	//rise
	if ground_pound_rise = true {
		can_rotate = false;
		vspeed = 0;
		if (angle != 0)	{
			var angle_side = sign(angle)
			angle += rotation_speed*sign(-angle);
			if (sign(angle) != angle_side) {
				angle = 0;
			}
		}
		
		if (ground_pound_distance_risen) < 32 {
			ground_pound_distance_risen += 1;
			with (msk_index) {
				if !place_meeting(x,y-1,obj_ground) {
					other.y -= 1;	
				}
			}
		}else {
			ground_pound_rise = false;
			ground_pound_slam = true;
		}
	}
	//slam
	if ground_pound_slam = true {
		vspeed = slam_speed;
		can_rotate = true; //allow rotation again
		vsp_basicjump = -8;
		//switch states
		if place_meeting(x,y+vspeed,obj_ground_parent) or place_meeting(x,y+vspeed,obj_enemy_parent) { 
			while !(place_meeting(x,y+sign(vspeed),obj_ground_parent)) and !(place_meeting(x,y+sign(vspeed),obj_enemy_parent)) {
				y += sign(vspeed);
			}
			state = state_bouncing;
			vspeed = 0;
			scr_Screen_Shake(6, 15);
		}
		
	}
}

state = state_free;
#endregion

#region //weapons

mouse_angle = 0; //direction from gun to mouse
knockback_angle = 0; //angle of knockback

ox = x; //original x position
oy = y; //original y position

//bullets
scr_Bullets();

//guns
scr_Guns();

canshoot = 0; //shooting timer
bullet_index = 0; //current bullet

gun_array = [default_gun,paintball_gun,shotgun_gun,bubble_gun,burstfire_gun,grenade_gun];
current_gun = 0;
gun = gun_array[current_gun];

#endregion

shoot_count = 0; // shoot count
jump_count = 0;  // bounce count
buff_active = false; // if the buff is active
buff_duration = 60 * 5; // buff duration timer