// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Guns(){
	with obj_player{
	default_gun = {
		_name: "Default Gun",  //name of gun
		sprite: spr_gun_default,   //gun sprite
		ammo: [default_bullet],//array of ammo
		inaccuracy: 0,        //random bullet angle inaccuracy
		kick: 2,              //kickback to position and angle
		sound: snd_defaultgun,    //sound effect
		spread_number: 1,     //number of bullets per shot
		spread_angle: 0,      //angle between bullets in spread shot
		full_auto: false,     //hold down mouse to shoot vs click for each shot
		burst_number: 1,      //number of bullets in burst
		burst_delay: 0,       //delay between bursts
		momentum_added: 1,    //0.9, percentage of vsp_basicjump to apply for each bullet, 1 = 100%
		reset_momentum: true, //reset player speed to 0 for each bullet (false), or just add to current speed (false)
		bullets_per_bounce: 3 + obj_player.max_ammo_buff,//Number of bullets per clip
		current_bullets: 3,   //current number of bullets left
		max_speed: -vsp_basicjump //player cant move faster than this if full_auto = true
	};
	
	hat_gun = {
		_name: "Hat Gun",
		sprite: spr_nothing,
		ammo: [hatgun_bullet],
		inaccuracy: 0,
		kick: 2,
		sound: snd_defaultgun,
		spread_number: 1,
		spread_angle: 0,
		full_auto: false,
		burst_number: 1,
		burst_delay: 0,
		momentum_added: 0,
		reset_momentum: false,
		bullets_per_bounce: 1 + obj_player.max_ammo_buff,
		current_bullets: 1,
		max_speed: -vsp_basicjump
	};


	paintball_gun = {
		_name: "Paintball Gun",  
		sprite: spr_gun_paintball,   
		ammo: [paintball_bullet],     
		inaccuracy: 5,     
		kick: 2,           
		sound: snd_paintball, 
		spread_number: 1,     
		spread_angle: 0, 
		full_auto: true,    
		burst_number: 1,      
		burst_delay: 0,       
		momentum_added: 0.4,  
		reset_momentum: false, 
		bullets_per_bounce: 10 + obj_player.max_ammo_buff,
		current_bullets: 10,   
		max_speed: -vsp_basicjump           
	};

	shotgun_gun = {
		_name: "Shotgun",  
		sprite: spr_gun_shotgun,  
		ammo: [shotgun_bullet],
		inaccuracy: 0,       
		kick: 2,             
		sound: snd_shotgun,
		spread_number: 5,     
		spread_angle: 15,     
		full_auto: false,     
		burst_number: 1,    
		burst_delay: 0,     
		momentum_added: 1.25, 
		reset_momentum: true, 
		bullets_per_bounce: 2 + obj_player.max_ammo_buff,
		current_bullets: 2,  
		max_speed: -vsp_basicjump          
	};

	bubble_gun = {
		_name: "Bubble Gun",  
		sprite: spr_gun_bubble,   
		ammo: [bubble_bullet],
		inaccuracy: 35,       
		kick: 2,              
		sound: snd_bubble,
		spread_number: 1,    
		spread_angle: 15,    
		full_auto: true,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 0.2, 
		reset_momentum: false, 
		bullets_per_bounce: 25 + obj_player.max_ammo_buff,
		current_bullets: 25,  
		max_speed: 8.5  
	};

	burstfire_gun = {
		_name: "Burst Fire Gun",  
		sprite: spr_gun_burstfire,   
		ammo: [burstfire_bullet],
		inaccuracy: 10,       
		kick: 2,              
		sound: snd_burstfire,
		spread_number: 1,    
		spread_angle: 15,    
		full_auto: true,     
		burst_number: 3,     
		burst_delay: 6,     
		momentum_added: 1, 
		reset_momentum: false, 
		bullets_per_bounce: 9 + obj_player.max_ammo_buff,
		current_bullets: 9,  
		max_speed: -vsp_basicjump
	};	
	
	grenade_gun = {
		_name: "Grenade Launcher",  
		sprite: spr_gun_grenade,   
		ammo: [grenade_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_grenade,
		spread_number: 1,    
		spread_angle: 0,    
		full_auto: false,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 0.9, 
		reset_momentum: true, 
		bullets_per_bounce: 3 + obj_player.max_ammo_buff,
		current_bullets: 3,  
		max_speed: -vsp_basicjump*0.9
	};	
	
	laser_gun = {
		_name: "Laser Gun",  
		sprite: spr_gun_laser,   
		ammo: [laser_bullet],
		inaccuracy: 0,       
		kick: 2,              
		sound: snd_laser,
		spread_number: 1,    
		spread_angle: 0,    
		full_auto: false,     
		burst_number: 1,     
		burst_delay: 0,     
		momentum_added: 0.075, 
		reset_momentum: false, 
		bullets_per_bounce: 80 + obj_player.max_ammo_buff,
		current_bullets: 80,  
		max_speed: -vsp_basicjump
	};	
	}
}