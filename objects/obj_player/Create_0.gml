/// @description initialize variables

//feel free to make copies of this object to mess around with movement values
grv = 0.21; //gravity
h_grv = 0.01; //horizontal drag
rotation_speed = 3; //rotation speed
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
free = true; //pogo not colliding with wall, this variable ensures the player doesn't get stuck in walls

//set controls variables
key_right = 0;
key_left = 0;
key_fire_projectile = 0;
key_right_pressed = 0;
key_left_pressed = 0;
key_fire_projectile_pressed = 0;

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

state_rising = function() {
	//falling
	vspeed += grv;
	//horizontal drag
	if hspeed > 0 {
		motion_add(180,h_grv);
	}else if hspeed < 0 {
		motion_add(0,h_grv);
	}
	
	//check for collision with ground
	if (place_meeting(x+hspeed,y,obj_ground)) and free = true {
		while !(place_meeting(x+sign(hspeed),y,obj_ground)) {
			x += sign(hspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
	}
	
	if (place_meeting(x,y+vspeed,obj_ground)) and free = true {
		while !(place_meeting(x,y+sign(vspeed),obj_ground)) {
			y += sign(vspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
	}
	if !(place_meeting(x+hspeed,y+vspeed,obj_ground)) and free = false {
		free = true;	
	}
		
	//restart room if reached the top
	if (bbox_bottom < 0 and mask_index != spr_nothing) {
		room_restart();
	}
	
	sprite_index = falling_sprite; //set player sprite
	
	if vspeed > 0 {
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
	
	//check for collision with ground
	if (place_meeting(x+hspeed,y,obj_ground)) and free = true {
		while !(place_meeting(x+sign(hspeed),y,obj_ground)) {
			x += sign(hspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
	}
	
	if (place_meeting(x,y+vspeed,obj_ground)) and free = true {
		while !(place_meeting(x,y+sign(vspeed),obj_ground)) {
			y += sign(vspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
	}
	if !(place_meeting(x+hspeed,y+vspeed,obj_ground)) and free = false {
		free = true;	
	}
	
	if vspeed < 0 {
		state = state_rising;
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
	if place_meeting(x, y+1, obj_conveyor_belt) {
		conveyor_speed = 4;
		if (instance_place(x, y+1, obj_conveyor_belt).image_xscale > 0) {
			x += conveyor_speed;
		}
		else {
			conveyor_speed *= -1;
			x -= conveyor_speed;
		}
		image_xscale = sign(conveyor_speed);
	}
	else if conveyor_speed != 0 {
		hspeed = conveyor_speed;
		conveyor_speed = 0;
		state = state_falling;
	}
	
	//bounce after animation is complete
	if (animation_complete) {
		speed = vsp_basicjump; //bounce speed
		direction = angle - 90; //bounce angle
		image_index = 0; //reset animation to starting frame
		animation_complete = false;
		gun.current_bullets = gun.bullets_per_bounce; //reload bullets
		state = state_rising;
	}
}

state = state_falling;
#endregion

#region //weapons

mouse_angle = 0; //direction from gun to mouse
knockback_angle = 0; //angle of knockback

ox = x; //original x position
oy = y; //original y position

#region //bullets
default_bullet = {
	sprite: spr_projectile_default,//bullet sprite
	gui_sprite: spr_projectile_default_gui, //bullet gui sprite
	spd: 15,                        //speed of bullet
	firerate_start: 1,              //initial firerate, higher = slower
	firerate_end: 1,                //max firerate, higher = slower
	firerate_mult: 0,               //multiplication of firerate per shot
	firerate: 1,                    //current firerate, higher = slower
	destroy_on_impact: true         //destroy when touching ground or not
};

paintball_bullet = {
	sprite: spr_projectile_paintball1,
	gui_sprite: spr_projectile_paintball_gui,
	spd: 15,                          
	firerate_start: 5,               
	firerate_end: 5,                 
	firerate_mult: 0,               
	firerate: 5,                     
	destroy_on_impact: true         
};

shotgun_bullet = {
	sprite: spr_projectile_nerfdart,
	gui_sprite: spr_projectile_nerfdart_gui,
	spd: 15,                        
	firerate_start: 1,              
	firerate_end: 1,                
	firerate_mult: 0,               
	firerate: 1,                    
	destroy_on_impact: true         
};

speedup_bullet = {
	sprite: spr_projectile_speedup,
	gui_sprite: spr_projectile_speedup_gui,
	spd: 15,                         
	firerate_start: 10,               
	firerate_end: 2,                
	firerate_mult: 0.6,                
	firerate: 3,                     
	destroy_on_impact: true          
};

burstfire_bullet = {
	sprite: spr_projectile_burstfire,
	gui_sprite: spr_projectile_burstfire_gui,
	spd: 15,                       
	firerate_start: 30,            
	firerate_end: 30,           
	firerate_mult: 0,              
	firerate: 30,                 
	destroy_on_impact: true      
};
#endregion

#region //guns
default_gun = {
	name: "Default Gun",  //name of gun
	sprite: spr_player,   //gun sprite
	ammo: [default_bullet],//array of ammo
	inaccuracy: 0,        //random bullet angle inaccuracy
	kick: 2,              //kickback to position and angle
	//sound: snd_nothing, //sound effect
	spread_number: 1,     //number of bullets per shot
	spread_angle: 0,      //angle between bullets in spread shot
	full_auto: false,     //hold down mouse to shoot vs click for each shot
	burst_number: 1,      //number of bullets in burst
	burst_delay: 0,       //delay between bursts
	momentum_added: 0.9,  //percentage of vsp_basicjump to apply for each bullet, 1 = 100%
	reset_momentum: true, //reset player speed to 0 for each bullet (false), or just add to current speed (false)
	bullets_per_bounce: 3,//Number of bullets per clip
	current_bullets: 3,   //current number of bullets left
	max_speed: 5          //player cant move faster than this if full_auto = true
};

paintball_gun = {
	name: "Paintball Gun",  
	sprite: spr_player,   
	ammo: [paintball_bullet],     
	inaccuracy: 5,     
	kick: 2,           
	//sound: snd_nothing, 
	spread_number: 1,     
	spread_angle: 0, 
	full_auto: true,    
	burst_number: 1,      
	burst_delay: 0,       
	momentum_added: 0.4,  
	reset_momentum: false, 
	bullets_per_bounce: 10,
	current_bullets: 10,   
	max_speed: 6           
};

shotgun_gun = {
	name: "Shotgun",  
	sprite: spr_player,  
	ammo: [shotgun_bullet],
	inaccuracy: 0,       
	kick: 2,             
	//sound: snd_nothing,
	spread_number: 5,     
	spread_angle: 15,     
	full_auto: false,     
	burst_number: 1,    
	burst_delay: 0,     
	momentum_added: 1.25, 
	reset_momentum: true, 
	bullets_per_bounce: 2,
	current_bullets: 2,  
	max_speed: 6          
};

negev_gun = {
	name: "Frenzy Gun",  
	sprite: spr_player,   
	ammo: [speedup_bullet],
	inaccuracy: 35,       
	kick: 2,              
	//sound: snd_nothing,
	spread_number: 1,    
	spread_angle: 15,    
	full_auto: true,     
	burst_number: 1,     
	burst_delay: 0,     
	momentum_added: 0.2, 
	reset_momentum: false, 
	bullets_per_bounce: 30,
	current_bullets: 30,  
	max_speed: 9       
};

burstfire_gun = {
	name: "Burst Fire Gun",  
	sprite: spr_player,   
	ammo: [burstfire_bullet],
	inaccuracy: 10,       
	kick: 2,              
	//sound: snd_nothing,
	spread_number: 1,    
	spread_angle: 15,    
	full_auto: true,     
	burst_number: 3,     
	burst_delay: 6,     
	momentum_added: 1, 
	reset_momentum: false, 
	bullets_per_bounce: 9,
	current_bullets: 9,  
	max_speed: 6          
};	

#endregion

canshoot = 0; //shooting timer
bullet_index = 0; //current bullet

gun_array = [default_gun,paintball_gun,shotgun_gun,negev_gun,burstfire_gun];
current_gun = 0;
gun = gun_array[current_gun];

#endregion

shoot_count = 0; // shoot count
jump_count = 0;  // bounce count
buff_active = false; // if the buff is active
buff_duration = 60 * 5; // buff duration timer