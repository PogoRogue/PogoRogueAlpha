/// @description initialize variables

//feel free to make copies of this object to mess around with movement values
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
charge = 0;
charge_max = vsp_basicjump;
slower_than_max = false; //ammo momentum for super jump
current_max = 0;

//set controls variables
key_right = 0;
key_left = 0;
key_fire_projectile = 0;
key_right_pressed = 0;
key_left_pressed = 0;
key_fire_projectile_pressed = 0;
key_charge_jump = 0;

player_sprite = spr_player_zekai;
falling_sprite = spr_player_zekai_falling;
falling_sprite2 = spr_player_zekai_falling;

dead = false;

// Stats
hp = 24;
max_hp = 24;
stomp_damage = 8;
num_iframes = room_speed;
current_iframes = 0;

conveyor_speed = 0;

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
	
	vspeed += grv; //falling
	
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
}

state_bouncing = function() {
	
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
	if (animation_complete and !key_charge_jump) {
		scr_Jump(0);
	}else if (animation_complete) {
		state = state_charging;
	}
}

state_charging = function() {
	
	// Conveyor belt handling
	scr_Conveyor_Belt();
	
	if !(key_charge_jump) {
		scr_Screen_Shake((charge/charge_max)*(-vsp_basicjump - 2)+(-2 + (-vsp_basicjump)),(charge/charge_max)*10+5)
		scr_Jump(charge);
	}else {
		if (charge > charge_max) {
			charge += charge_max/80; //80 = how many frames until max charge
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

gun_array = [default_gun,paintball_gun,shotgun_gun,bubble_gun,burstfire_gun];
current_gun = 0;
gun = gun_array[current_gun];

#endregion

shoot_count = 0; // shoot count
jump_count = 0;  // bounce count
buff_active = false; // if the buff is active
buff_duration = 60 * 5; // buff duration timer