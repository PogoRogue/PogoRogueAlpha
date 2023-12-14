// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Player_Damaged(damage){
	
	with obj_player {
		if !instance_exists(obj_shieldbubble) and invincible = false {
			hp -= (damage * (100 / (100 + armor_buff))); // factor in dmg mitigation from armor. If armor is 50, take 2/3 dmg
			current_iframes = num_iframes;
			hspeed = -2 * sign(hspeed);
			vspeed = 0;
		
			//combo reset
			global.combo = 0;
			global.combo_length = 0;
			
			//screen shake
			scr_Screen_Shake(8, 15);
			
			audio_play_sound(snd_hurt,0,false);
		}else if invincible = false {
			current_iframes = num_iframes;
			hspeed = -2 * sign(hspeed);
			vspeed = 0;
			
			with obj_shieldbubble {
				instance_destroy();	
			}
		}
	}
	
}