#region //weapons

mouse_angle = 0; //direction from gun to mouse
knockback_angle = 0; //angle of knockback

ox = x; //original x position
oy = y; //original y position
dead = false;

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

instance_create_depth(x,y,depth,obj_crosshair)