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
		destroy_on_impact: true         //destroy when touching ground or not
	};

	paintball_bullet = {
		sprite: spr_projectile_paintball1,
		gui_sprite: spr_projectile_paintball_gui,
		spd: 10,                          
		firerate_start: 5,               
		firerate_end: 5,                 
		firerate_mult: 0,               
		firerate: 5,                     
		destroy_on_impact: true         
	};

	shotgun_bullet = {
		sprite: spr_projectile_nerfdart,
		gui_sprite: spr_projectile_nerfdart_gui,
		spd: 10,                        
		firerate_start: 1,              
		firerate_end: 1,                
		firerate_mult: 0,               
		firerate: 1,                    
		destroy_on_impact: true         
	};

	speedup_bullet = {
		sprite: spr_projectile_speedup,
		gui_sprite: spr_projectile_speedup_gui,
		spd: 10,                         
		firerate_start: 2, //10            
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
}