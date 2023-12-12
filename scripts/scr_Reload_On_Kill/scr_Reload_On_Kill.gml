// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Reload_On_Kill(){
	if(object_get_parent(other.object_index) != obj_boss_brick){ // Don't reload for boss bricks
		if other.hp <= 0 {
			with obj_player {
				gun.current_bullets = gun.bullets_per_bounce; //reload bullets	
			}
		}
	}
}