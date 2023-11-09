// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Bullets(){
	
	default_bullet = {
		sprite: spr_projectile_default, //bullet sprite
		gui_sprite: spr_projectile_default_gui, //bullet gui sprite
		spd: 10,                        //speed of bullet
		firerate_start: 1,              //initial firerate, higher = slower
		firerate_end: 1,                //max firerate, higher = slower
		firerate_mult: 0,               //multiplication of firerate per shot
		firerate: 1,                    //current firerate, higher = slower
		destroy_on_impact: true,        //destroy when touching ground or not
		screen_shake: {magnitude: 2.5, frames: 10}, //screen shake, magnitude = distance rance in pixels, frames = # of frames (60 = 1 second)
		destroy_time: 0,                 //frames to destroy projectile after spawn, 0 = no destroy time
		flash_frame: 2                //how big of a flash you want the bullet to make, 0 = biggest, 12 = nothing/smallest
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
		flash_frame: 4
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
		flash_frame: 0
	};

	speedup_bullet = {
		sprite: spr_projectile_speedup,
		gui_sprite: spr_projectile_speedup_gui,
		spd: 6,                         
		firerate_start: 2, //10            
		firerate_end: 2,                
		firerate_mult: 0.6,                
		firerate: 3,                     
		destroy_on_impact: true,
		screen_shake: {magnitude: 1.5, frames: 5},
		destroy_time: 18,
		flash_frame: 5
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
		flash_frame: 1
	};
}