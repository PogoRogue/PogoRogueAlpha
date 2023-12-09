/// @description damage enemy

if(!other.is_dead && other.current_iframes <= 0 && !array_contains(damaged_list, other)) {
	other.hp -= damage;
	other.red_frames = 10;
	if other.hp <= 0 {
		if chargejump = true {
			obj_player.pickup_chargejump.cooldown_time = 0;	
		}else {
			obj_player.pickup_firedash.cooldown_time = 0;	
		}
	}
	scr_Reload_On_Kill();
	damaged_list = array_concat(damaged_list, [other]);
}