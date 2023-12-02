// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Reload_On_Kill(){
	if other.hp <= 0 {
		with obj_player {
			gun.current_bullets = gun.bullets_per_bounce; //reload bullets	
		}
	}
}