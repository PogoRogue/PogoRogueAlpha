/// @description initialize variables
//movement stats
grv = 0.21; //gravity
h_grv = 0.01; //horizontal drag
rotation_speed = 3; //rotation speed
current_rotation_speed = 0;
rotation_delay = rotation_speed / 10; //0.5
vsp_basicjump = -6.6; //bounce height
angle = 0;
anglemax = 45; //maximum degrees added on either side
bouncing = false; //bouncing animation when true
bounce_sound = true; //alternating pitch
shop_bouncing = false; //only use this var in the shop
animation_complete = false; //bounce animation before jumping
use_mouse = false; //use mouse to control instead of WASD/Arrow keys?
mouse_sensitivity = 150; //the lower the value, the more sensitive the player is to mouse movement and vice versa
mouse_reanglespeed = 4; //the lower the value, the faster the player will reangle itself and vice versa
invert = false;
free = true; //pogo not colliding with wall, this variable ensures the player doesn't get stuck in walls
conveyor_speed = 0;
can_rotate = true;
can_shoot = true;
platform_on = true;

//buffs
laser_sight = false;
planetary_bullets = 0;
all_buff_sprites = [];
all_buff_sprites_index = [];

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
invincible = false;
max_dash_time = 15;
dash_time = 15;

//upward flames
min_flames_speed = 5.6;
allow_flames = false;

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
charging_sprite = spr_player_zekai_charging;

// Stats
hp = 40;
max_hp = 40;
stomp_damage = 8;
num_iframes = 1.5 * room_speed;
current_iframes = 0;
dead = false;

// Room Gate Handling
enemies_killed = 0;
enemies_required = 0;

//starting position
if global.player_spawn_x = 0 and global.player_spawn_y = 0 {
	global.player_spawn_x = x;
	global.player_spawn_y = y;
}

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

//delete duplicate player 
if instance_number(obj_player) > 1 {
	instance_destroy();	
	instance_destroy(msk_index);
}

//item Code
has_item = false; // // Whether the player is equipped with a weapon
equipped_item = noone; // The weapon that initializes the equipment is none

#region //STATES

state_free = function() {
	bouncing = false;
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
	
	//check for collision with on off platform	
	if (place_meeting(x,y+vspeed,obj_temp_platform_on_off) and !place_meeting(x,y-1,obj_temp_platform_on_off)) and vspeed > 0 and platform_on {
		while !(place_meeting(x,y+sign(vspeed),obj_temp_platform_on_off)) {
			y += sign(vspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
	}
	
	//check for collision with off on platform	
	if (place_meeting(x,y+vspeed,obj_temp_platform_off_on) and !place_meeting(x,y-1,obj_temp_platform_off_on)) and vspeed > 0 and !platform_on {
		while !(place_meeting(x,y+sign(vspeed),obj_temp_platform_off_on)) {
			y += sign(vspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
	}
	
	//make sure player isn't colliding with anything before checking for collisions again
	if !(place_meeting(x,y,obj_ground)) and !(place_meeting(x,y,obj_enemy_parent)) and free = false {
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
	
	//restart room if reached the top unless procgen room
	if room != room_proc_gen_test {
		if (bbox_bottom < 0 and mask_index != spr_nothing) {
			room_restart();
		}
	}
	
	//create upward flames if fast enough
	if speed >= min_flames_speed and !instance_exists(obj_player_flames_upward) and vspeed < 0 and allow_flames = true {
		//temporarily disabled
		//instance_create_depth(x,y,depth+1,obj_player_flames_upward);
	}

}

state_bouncing = function() {
	bouncing = true;
	//on create
	if floor(image_index) = 0 {
		can_rotate = true;
		can_shoot = true;
	}
	free = false;
	sprite_index = player_sprite; //set sprite
	
	//animate before bouncing
	if (floor(image_index) = sprite_get_number(sprite_index)-1) {
		animation_complete = true;
	}else if (animation_complete = false) {
		image_index += 0.75;
	}
	
	// Conveyor belt handling
	scr_Conveyor_Belt();
	
	//bounce after animation is complete
	var not_charging_1 = !(key_pickup_1 and pickups_array[0] = pickup_chargejump and pickups_array[0].on_cooldown = false);
	var not_charging_2 = !(key_pickup_2 and pickups_array[1] = pickup_chargejump and pickups_array[1].on_cooldown = false);
	if (animation_complete and not_charging_1 and not_charging_2) {
		scr_Jump(0);
		platform_on = !platform_on;
	}
}

state_chargejump = function() {
	var end_of_charge = false;
	if !audio_is_playing(snd_chargejump) { //sound
		if (charge > charge_max) {
			audio_play_sound(snd_chargejump,0,false);
		}else {
			end_of_charge = true;
		}
	}
	
	bouncing = true;
	sprite_index = charging_sprite;
	image_speed = 1;
	vsp_basicjump = -6.6;
	
	// Conveyor belt handling
	scr_Conveyor_Belt();
	
	var not_charging_1 = !(key_pickup_1 and pickups_array[0] = pickup_chargejump);
	var not_charging_2 = !(key_pickup_2 and pickups_array[1] = pickup_chargejump);
	
	if not_charging_1 and not_charging_2 or end_of_charge {
		scr_Screen_Shake((charge/charge_max)*(-vsp_basicjump - 2)+(-2 + (-vsp_basicjump)),(charge/charge_max)*10+5)
		scr_Jump(charge);
		audio_stop_sound(snd_chargejump);
		allow_flames = true;
		min_flames_speed = 7.2;
		pickup_chargejump.on_cooldown = true;
		if !instance_exists(obj_player_flames_upward) {
			instance_create_depth(x,y,depth+1,obj_player_flames_upward);	
		}
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
			var angle_side = sign(angle);
			angle += rotation_speed*sign(-angle);
			if (sign(angle) != angle_side) {
				angle = 0;
				current_rotation_speed = 0;
			}
		}
		
		if (ground_pound_distance_risen) < 32 {
			ground_pound_distance_risen += 1;
			with (msk_index) {
				if !place_meeting(x,y-1,obj_ground) {
					other.vspeed = -1;	
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
			scr_Enemy_Collision_Check(true);
			pickup_groundpound.on_cooldown = true;
			state = state_bouncing;
			vspeed = 0;
			scr_Screen_Shake(6, 15);
			audio_play_sound(snd_groundpound,0,false);
		}
		
	}
}

state_firedash = function() {
	can_rotate = false;
	can_shoot = false;
	if dash_time > 0 {
		invincible = true;
		speed = 10;
		direction = image_angle+90;
		min_flames_speed = speed;
		scr_Screen_Shake(4, 4);
		if !instance_exists(obj_player_flames_upward) {
			instance_create_depth(x,y,depth+1,obj_player_flames_upward);	
		}
		dash_time -= 1;
	}else {
		speed = speed/1.5;
		state = state_free;
		dash_time = max_dash_time;
		if instance_exists(obj_player_flames_upward) {
			obj_player_flames_upward.despawn = true;	
		}
	}
}

state_shop = function() {
	angle = 0;	
	can_rotate = false;
	can_shoot = false;
	vspeed += grv;
	
	//check for collision with ground y axis
	if (place_meeting(x,y+vspeed,obj_ground)) {
		while !(place_meeting(x,y+sign(vspeed),obj_ground)) {
			y += sign(vspeed);
		}
		shop_bouncing = true;
		speed = 0; //stop player movement while bouncing
	}
	
	if shop_bouncing = true {
		sprite_index = player_sprite; //set sprite
		//animate before bouncing
		if (floor(image_index) = sprite_get_number(sprite_index)-1) {
			animation_complete = true;
		}else if (animation_complete = false) {
			image_index += 0.75;
		}
		if scr_Animation_Complete() = true {
			scr_Jump(0);
			shop_bouncing = false;
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

//EQUIP WEAPONS
num_of_weapons = 2; //number of different weapons equipped: only do 1 or 2
all_guns_array = [default_gun,paintball_gun,shotgun_gun,bubble_gun,burstfire_gun,grenade_gun,laser_gun]; //all guns

if (random_weapon = true) { //choose random weapons
	randomize();
	gun_1 = all_guns_array[irandom_range(0,array_length(all_guns_array)-1)];
	gun_2 = all_guns_array[irandom_range(0,array_length(all_guns_array)-1)];

	while (gun_2 = gun_1) { //dont want 2 of the same weapon
		gun_2 = all_guns_array[irandom_range(0,array_length(all_guns_array)-1)];
	}
}else { //decide which weapons we want manually if not random. 
	//we do this by changing gun_1_manual and gun_2_manual in the variable definitions tab. Can be changed room by room.
	//Integers correspond to values in all_guns_array, 0 = default_gun, 1 = paintball_gun, etc.
	gun_1 = all_guns_array[gun_1_manual_value];
	gun_2 = all_guns_array[gun_2_manual_value];
}

//set what weapons will actually be equipped at the start
if (num_of_weapons = 1) {
	gun_array = [gun_1];
}else {
	gun_array = [gun_1, gun_2];
}
current_gun = 0;
gun = gun_array[current_gun];

#endregion

shoot_count = 0; // shoot count
jump_count = 0;  // bounce count
buff_active = false; // if the buff is active
buff_duration = 60 * 5; // buff duration timer

//pickups
scr_Pickups();

num_of_pickups = 2; //number of different pickups equipped: only do 1 or 2
all_pickups_array = [pickup_chargejump,pickup_groundpound,pickup_hatgun,pickup_shieldbubble,pickup_firedash]; //all pickups

if (random_pickup = true) { //choose random pickups
	randomize();
	pickup_1 = all_pickups_array[irandom_range(0,array_length(all_pickups_array)-1)];
	pickup_2 = all_pickups_array[irandom_range(0,array_length(all_pickups_array)-1)];

	while (pickup_2 = pickup_1) { //dont want 2 of the same weapon
		pickup_2 = all_pickups_array[irandom_range(0,array_length(all_pickups_array)-1)];
	}
}else { //decide which pickups we want manually if not random. 
	//we do this by changing pickup_1_manual and pickup_2_manual in the variable definitions tab. Can be changed room by room.
	//Integers correspond to values in all_pickups_array, 0 = pickup_chargejump, 1 = pickup_groundpound, etc.
	pickup_1 = all_pickups_array[pickup_1_manual_value];
	pickup_2 = all_pickups_array[pickup_2_manual_value];
}

//set what weapons will actually be equipped at the start
if (num_of_pickups = 1) {
	pickups_array = [pickup_1,pickup_nothing];
}else {
	pickups_array = [pickup_1, pickup_2];
}

//buffs
scr_Buffs();

//create text in proc gen room
if room = room_proc_gen_test {
	alarm[2] = 10;
}