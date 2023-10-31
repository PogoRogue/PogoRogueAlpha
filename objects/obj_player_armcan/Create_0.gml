/// @description initialize variables

//feel free to make copies of this object to mess around with movement values
grv = 0.21; //gravity
h_grv = 0.01; //horizontal drag
rotation_speed = 2.5; //rotation speed
current_rotation_speed = rotation_speed;
rotation_delay = rotation_speed / 5; //0.5
vsp_basicjump = -6.6; //bounce height
angle = 0;
anglemax = 40; //maximum degrees added on either side
bouncing = false; //bouncing animation when true
animation_complete = false; //bounce animation before jumping
use_mouse = false; //use mouse to control instead of WASD/Arrow keys?
mouse_sensitivity = 150; //the lower the value, the more sensitive the player is to mouse movement and vice versa
mouse_reanglespeed = 4; //the lower the value, the faster the player will reangle itself and vice versa
invert = false;
//set controls variables
key_right = 0;
key_left = 0;
key_fire_projectile = 0;
key_right_pressed = 0;
key_left_pressed = 0;
key_fire_projectile_pressed = 0;

player_sprite = spr_player;
falling_sprite = spr_player_falling;
falling_sprite2 = spr_player_falling2;

dead = false;

image_speed = 0;

depth = -10;

if (global.arm_cannon = false) {
	instance_destroy();
}else {
	arm_cannon = instance_create_depth(x,y,depth-1, obj_arm_cannon);
	gun = arm_cannon.gun;
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

state_rising = function() {
	//falling
	vspeed += grv;
	//horizontal drag
	if hspeed > 0 {
		motion_add(180,h_grv);
	}else if hspeed < 0 {
		motion_add(0,h_grv);
	}
	
	//check for collision with ground below
	if (place_meeting(x,y+vspeed,obj_ground)) {
		while !(place_meeting(x,y+sign(vspeed),obj_ground)) {
			y += sign(vspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
	}
		
	//restart room if reached the top
	if (bbox_bottom < 0 and mask_index != spr_nothing) {
		room_restart();
	}
	
	sprite_index = player_sprite; //set player sprite
	
	if vspeed >= 0 {
		state = state_falling;
	}
}

state_falling = function() {
	vspeed += grv; //falling
	
	//horizontal drag
	if hspeed > 0 {
		motion_add(180,h_grv);
	}else if hspeed < 0 {
		motion_add(0,h_grv);
	}
	
	//check for collision with ground below
	if (place_meeting(x,y+vspeed,obj_ground_oneway) and !place_meeting(x,y-1,obj_ground_oneway)) {
		while !(place_meeting(x,y+sign(vspeed),obj_ground_oneway)) {
			y += sign(vspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
	}
	
	if (place_meeting(x,y+vspeed,obj_ground)) {
		while !(place_meeting(x,y+sign(vspeed),obj_ground)) {
			y += sign(vspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
	}
	
	if vspeed < 0 {
		state = state_rising;
	}
	
	//falling animation
	if (vspeed > 1.4) {
		sprite_index = falling_sprite2;
	}else {
		sprite_index = falling_sprite;
	}
}

state_bouncing = function() {
	sprite_index = player_sprite; //set sprite
	
	//animate before bouncing
	if (image_index = sprite_get_number(sprite_index)-1) {
		animation_complete = true;
	}else if (animation_complete = false) {
		image_index += 1;
	}
	
	//bounce after animation is complete
	if (animation_complete) {
		speed = vsp_basicjump; //bounce speed
		direction = angle - 90; //bounce angle
		image_index = 0; //reset animation to starting frame
		animation_complete = false;
		arm_cannon.gun.current_bullets = arm_cannon.gun.bullets_per_bounce; //reload bullets
		state = state_rising;
	}
}

state_wallstun = function() {
	
}

state = state_falling;
#endregion

shoot_count = 0; // shoot count
jump_count = 0;  // bounce count
buff_active = false; // if the buff is active
buff_duration = 60 * 5; // buff duration timer