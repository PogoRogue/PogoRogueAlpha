// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Reload_On_Kill(){
	if(object_get_parent(other.object_index) != obj_boss_brick) { // Don't reload for boss bricks
		if other.hp <= 0 {
			with obj_player {
				if gun.current_bullets < gun.bullets_per_bounce+obj_player.max_ammo_buff and gun != boomerang_gun {
					gun.current_bullets = gun.bullets_per_bounce+obj_player.max_ammo_buff; //reload bullets	
					instance_create_depth(x+lengthdir_x(16,image_angle+90),y+lengthdir_y(16,image_angle+90),depth-1,obj_bulletcasing);
					audio_play_sound(snd_reload,0,false);
				}
			}
			//reload hat gun on hat gun kill
			if object_get_name(object_index) = "obj_projectile"  {
				if (gun_name = "Hat Gun") {
					with obj_player {
						pickup_hatgun.uses_per_bounce = pickup_hatgun.max_uses_per_bounce;
						pickup_hatgun.on_cooldown = false;
					}
				}
			}
		}
	}
}