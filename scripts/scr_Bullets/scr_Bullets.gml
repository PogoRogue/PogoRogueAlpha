// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Bullets(){
	
	default_bullet = {
		sprite: spr_projectile_default, //bullet sprite
		gui_sprite: spr_projectile_default_gui, //bullet gui sprite
		spd: 15,                        //speed of bullet
		firerate_start: 1,              //initial firerate, higher = slower
		firerate_end: 1,                //max firerate, higher = slower
		firerate_mult: 0,               //multiplication of firerate per shot
		firerate: 1,                    //current firerate, higher = slower
		destroy_on_impact: true,        //destroy when touching ground or not
		screen_shake: {magnitude: 2.5, frames: 10}, //screen shake, magnitude = distance rance in pixels, frames = # of frames (60 = 1 second)
		destroy_time: 0,                 //frames to destroy projectile after spawn, 0 = no destroy time
		flash_frame: 2,                  //how big of a flash you want the bullet to make, 0 = biggest, 12 = nothing/smallest
		grav_affected: false,            //is this bullet affected by gravity
		grv: obj_player.grv,             //amount of gravity added per frame
		num_of_bounces: 0,               //how many times will this bullet bounce before being destroyed
		bounce_amount: 1,                //multiply hspeed/vspeed by this amount per bounce, 1 = no slowdown
		damage: 8                         //how much damage each bullet does
	};
	
	hatgun_bullet = {
		sprite: spr_projectile_default,
		gui_sprite: spr_projectile_default_gui,
		spd: 15,                          
		firerate_start: 1,               
		firerate_end: 1,                 
		firerate_mult: 0,               
		firerate: 1,                     
		destroy_on_impact: true,
		screen_shake: {magnitude: 2.5, frames: 10},
		destroy_time: 0,
		flash_frame: 12,
		grav_affected: false,
		grv: obj_player.grv,
		num_of_bounces: 0,
		bounce_amount: 1,
		damage: 8
	};
	
	bulletblast_bullet = {
		sprite: spr_planetarybullets_bullet,
		gui_sprite: spr_planetarybullets_bullet,
		spd: 12,
		firerate_start: 1,
		firerate_end: 1,
		firerate_mult: 0,
		firerate: 1,
		destroy_on_impact: false,
		screen_shake: {magnitude: 20, frames: 10},
		destroy_time: 0,
		flash_frame: 12,
		grav_affected: false,
		grv: obj_player.grv,
		num_of_bounces: 0,
		bounce_amount: 1,
		damage: 20
	};

	paintball_bullet = {
		sprite: spr_projectile_paintball1,
		gui_sprite: spr_projectile_paintball_gui,
		spd: 10,                          
		firerate_start: 5,               
		firerate_end: 5,                 
		firerate_mult: 0,               
		firerate: 5,                     
		destroy_on_impact: true,
		screen_shake: {magnitude: 2, frames: 8},
		destroy_time: 0,
		flash_frame: 4,
		grav_affected: false,
		grv: obj_player.grv,
		num_of_bounces: 0,
		bounce_amount: 1,
		damage: 6
	};

	shotgun_bullet = {
		sprite: spr_projectile_nerfdart,
		gui_sprite: spr_projectile_nerfdart_gui,
		spd: 10,                        
		firerate_start: 1,              
		firerate_end: 1,                
		firerate_mult: 0,               
		firerate: 1,                    
		destroy_on_impact: true,
		screen_shake: {magnitude: 6, frames: 15},
		destroy_time: 10,
		flash_frame: 0,
		grav_affected: false,
		grv: obj_player.grv,
		num_of_bounces: 0,
		bounce_amount: 1,
		damage: 10
	};

	bubble_bullet = {
		sprite: spr_projectile_bubble,
		gui_sprite: spr_projectile_bubble_gui,
		spd: 6,                         
		firerate_start: 2, //10            
		firerate_end: 2,                
		firerate_mult: 0.6,                
		firerate: 3,                     
		destroy_on_impact: true,
		screen_shake: {magnitude: 0, frames: 0},
		destroy_time: 20,
		flash_frame: 12,
		grav_affected: false,
		grv: obj_player.grv,
		num_of_bounces: 0,
		bounce_amount: 1,
		damage: 4
	};

	burstfire_bullet = {
		sprite: spr_projectile_burstfire,
		gui_sprite: spr_projectile_burstfire_gui,
		spd: 15,                       
		firerate_start: 30,            
		firerate_end: 30,           
		firerate_mult: 0,              
		firerate: 30,                 
		destroy_on_impact: true,
		screen_shake: {magnitude: 3, frames: 6},
		destroy_time: 0,
		flash_frame: 1,
		grav_affected: false,
		grv: obj_player.grv,
		num_of_bounces: 0,
		bounce_amount: 1,
		damage: 8
	};
	
	grenade_bullet = {
		sprite: spr_projectile_grenade,
		gui_sprite: spr_projectile_grenade_gui,
		spd: 5,                       
		firerate_start: 1,            
		firerate_end: 1,           
		firerate_mult: 0,              
		firerate: 1,                 
		destroy_on_impact: true,
		screen_shake: {magnitude: 3, frames: 6},
		destroy_time: 0,
		flash_frame: 1,
		grav_affected: true,
		grv: obj_player.grv,
		num_of_bounces: 1,
		bounce_amount: 0.8,
		damage: 8,
	};
	
	laser_bullet = {
		sprite: spr_projectile_laser_charging_start,
		gui_sprite: spr_projectile_laser_gui,
		spd: 0,                          
		firerate_start: 1,               
		firerate_end: 1,                 
		firerate_mult: 0,               
		firerate: 1,                     
		destroy_on_impact: false,
		screen_shake: {magnitude: 0, frames: 0},
		destroy_time: 0,
		flash_frame: 12,
		grav_affected: false,
		grv: obj_player.grv,
		num_of_bounces: 0,
		bounce_amount: 1,
		damage: 0.18 //per frame
	};
	
	bouncyball_bullet = {
		sprite: spr_projectile_bouncyball,
		gui_sprite: spr_projectile_bouncyball_gui,
		spd: 12,                          
		firerate_start: 8,               
		firerate_end: 8,                 
		firerate_mult: 0,               
		firerate: 8,                     
		destroy_on_impact: true,
		screen_shake: {magnitude: 2, frames: 8},
		destroy_time: 0,
		flash_frame: 4,
		grav_affected: false,
		grv: obj_player.grv,
		num_of_bounces: 3,
		bounce_amount: 1,
		damage: 7
	};
	
	missile_bullet = {
		sprite: spr_projectile_missile,
		gui_sprite: spr_projectile_missile_gui,
		spd: 0,                          
		firerate_start: 0,               
		firerate_end: 0,                 
		firerate_mult: 0,               
		firerate: 0,                     
		destroy_on_impact: true,
		screen_shake: {magnitude: 4, frames: 10},
		destroy_time: 0,
		flash_frame: 12,
		grav_affected: false,
		grv: obj_player.grv,
		num_of_bounces: 0,
		bounce_amount: 1,
		damage: 16
	};
	
	boomerang_bullet = {
		sprite: spr_projectile_boomerang,
		gui_sprite: spr_projectile_boomerang_gui,
		spd: 8,                          
		firerate_start: 0,               
		firerate_end: 0,                 
		firerate_mult: 0,               
		firerate: 0,                     
		destroy_on_impact: false,
		screen_shake: {magnitude: 3, frames: 8},
		destroy_time: 0,
		flash_frame: 12,
		grav_affected: false,
		grv: obj_player.grv,
		num_of_bounces: 0,
		bounce_amount: 1,
		damage: 8
	};
}