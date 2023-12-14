// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Increment_Max_Ammo(){
	with obj_player{
		for(i = 0; i < array_length(obj_player.all_guns_array); i++){
			obj_player.all_guns_array[i].bullets_per_bounce += obj_player.max_ammo_buff;
		}
	}
}