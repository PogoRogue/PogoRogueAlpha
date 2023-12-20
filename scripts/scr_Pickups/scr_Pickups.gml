// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Pickups(){
	
	pickup_nothing = {
		_name: "",                               //item name
		gui_sprite: spr_pickup_empty,           //pickup gui sprite
		max_cooldown_time: 0,                   //reset cooldown time to this value on every use
		cooldown_time: 0,                       //actual cooldown value that decreases over time when used
		on_cooldown: false,                     //is this pickup currently on cooldown
		states_to_call_in: [state_free],        //when this ability can be activated
		key_held: false,                        //do you need to hold the key to call this ability (true) or just press it (false)
		reload_on_bounce: false,                //does this ability recharge on bounce instead of cooldown?
		max_uses_per_bounce: 0,                 //how many times can you use this per bounce
		uses_per_bounce: 0,                     //same as max_uses_per_bounce, except this value changes
		on_call: function() { }                 //specific actions to do when this event is called           
	};
	
	pickup_chargejump = {
		_name: "Charge Jump",
		gui_sprite: spr_pickup_chargejump,
		max_cooldown_time: 300,
		cooldown_time: 300,
		on_cooldown: false,
		states_to_call_in: [state_bouncing],
		key_held: true,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		on_call: function() {
			if (obj_player.animation_complete) and obj_player.state != obj_player.state_chargejump {
				obj_player.state = obj_player.state_chargejump;
				obj_player.rotation_speed = obj_player.rotation_speed * 0.65;
			}
		}                  
	};
	
	pickup_groundpound = {
		_name: "Ground Pound",
		gui_sprite: spr_pickup_groundpound,
		max_cooldown_time: 180,
		cooldown_time: 180,
		on_cooldown: false,
		states_to_call_in: [state_free],
		key_held: false,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		on_call: function() {
			obj_player.state = obj_player.state_groundpound;
			obj_player.ground_pound_rise = true;
			obj_player.ground_pound_slam = false;
			obj_player.ground_pound_distance_risen = 0;
		}
	};
	
	pickup_hatgun = {
		_name: "Hat Gun",
		gui_sprite: spr_pickup_hatgun,
		max_cooldown_time: -1,
		cooldown_time: -1,
		on_cooldown: false,
		states_to_call_in: [state_free,state_bouncing,state_chargejump],
		key_held: false,
		reload_on_bounce: true,
		max_uses_per_bounce: 3,
		uses_per_bounce: 3,
		on_call: function() {
			with obj_player {
				old_gun = gun;
				gun = hat_gun;
				image_angle += 180;
				x -= lengthdir_x(68,image_angle+90);
				y -= lengthdir_y(68,image_angle+90);
				scr_Shoot();
				x += lengthdir_x(68,image_angle+90);
				y += lengthdir_y(68,image_angle+90);
				image_angle -= 180;
				gun = old_gun;
			}
			uses_per_bounce -= 1;
			if uses_per_bounce <= 0 {
				on_cooldown = true;
			}
		}
	};
	
	pickup_shieldbubble = {
		_name: "Shield Bubble",
		gui_sprite: spr_pickup_shieldbubble,
		max_cooldown_time: 600,
		cooldown_time: 600,
		on_cooldown: false,
		states_to_call_in: [state_free,state_bouncing,state_chargejump,state_groundpound,state_firedash,state_bulletblast],
		key_held: false,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		on_call: function() {
			if !instance_exists(obj_shieldbubble) {
				instance_create_depth(obj_player.x,obj_player.y,obj_player.depth+2,obj_shieldbubble);
			}
		}
	};
	
	pickup_firedash = {
		_name: "Fire Dash",
		gui_sprite: spr_pickup_firedash,
		max_cooldown_time: 300,
		cooldown_time: 300,
		on_cooldown: false,
		states_to_call_in: [state_free],
		key_held: false,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		on_call: function() {
			cooldown_time = max_cooldown_time;
			obj_player.state = obj_player.state_firedash;
			on_cooldown = true;
			audio_play_sound(snd_whoosh,0,false);
		}
	};
	
	pickup_jetpack = {
		_name: "Jetpack",
		gui_sprite: spr_pickup_jetpack,
		max_cooldown_time: 60,
		cooldown_time: 60,
		on_cooldown: false,
		states_to_call_in: [state_free],
		key_held: true,
		reload_on_bounce: true,
		max_uses_per_bounce: 1,
		uses_per_bounce: 1,
		on_call: function() {
			if cooldown_time > 0 {
				cooldown_time -= 1;
				with obj_player {
					//check if speed slower or faster than max speed to preserve momentum
					if (abs(speed) > 5.5 and vspeed < 0) {
						slower_than_max = false;
						current_max = speed;
					}else {
						slower_than_max = true;	
						current_max = 0;
					}
		
					//add momentum
					motion_add(angle - 90, vsp_basicjump * 0.12);
		
					//set max speed
					if (speed > 5.5) {
						speed = max(5.5, current_max);
					}
					
					//smoke
					if other.cooldown_time % 2 = 0 { //every other frame
						instance_create_depth(x+lengthdir_x(16,image_angle)+lengthdir_x(12,image_angle+90),y+lengthdir_y(16,image_angle)+lengthdir_y(12,image_angle+90),depth+1,obj_jetpack_smoke);
						instance_create_depth(x+lengthdir_x(-16,image_angle)+lengthdir_x(12,image_angle+90),y+lengthdir_y(-16,image_angle)+lengthdir_y(12,image_angle+90),depth+1,obj_jetpack_smoke);
					}
					
					//sound
					if !audio_is_playing(snd_jetpack) {
						audio_play_sound(snd_jetpack,0,false);
					}
				}
			}else {
				if audio_is_playing(snd_jetpack) {
					audio_stop_sound(snd_jetpack);
				}	
			}
			on_cooldown = true;
		}                  
	};
	
	pickup_slowmo = {
		_name: "Slow Mo",
		gui_sprite: spr_pickup_slowmo,
		max_cooldown_time: 1200,
		cooldown_time: 1200,
		on_cooldown: false,
		states_to_call_in: [state_free,state_bouncing,state_chargejump,state_groundpound,state_firedash,state_bulletblast],
		key_held: false,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		on_call: function() {
			if !instance_exists(obj_slowmo) {
				instance_create_depth(obj_player.x,obj_player.y,obj_player.depth+2,obj_slowmo);
			}
		}
	};
	
	pickup_bulletblast = {
		_name: "Bullet Blast",
		gui_sprite: spr_pickup_bulletblast,
		max_cooldown_time: 900,
		cooldown_time: 900,
		on_cooldown: false,
		states_to_call_in: [state_free],
		key_held: false,
		reload_on_bounce: false,
		max_uses_per_bounce: 0,
		uses_per_bounce: 0,
		on_call: function() {
			obj_player.can_rotate = false;
			obj_player.can_shoot = false;
			obj_player.bulletblast_frames = 0;
			obj_player.temp_x = 0.5;
			obj_player.init_x = obj_player.x;
			obj_player.sprite_index = spr_player_zekai;
			obj_player.image_index = 0;
			obj_player.state = obj_player.state_bulletblast;
			on_cooldown = true;
		}
	};
	
}