// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Player_Damaged(damage){
	
	with obj_player {
		hp -= damage;
		current_iframes = num_iframes;
		hspeed = -2 * sign(hspeed);
		vspeed = 0;
		
		//combo reset
		global.combo = 0;
		global.combo_length = 0;
	}
	
	//screen shake
	scr_Screen_Shake(8, 15);
}