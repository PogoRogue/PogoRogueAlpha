/// @description Damage enemy

if(!other.is_dead && other.current_iframes <= 0) {
	other.hp -= (damage + obj_player.damage_buff) * other.bullet_defense;
	other.red_frames = 10;
	
	scr_Reload_On_Kill();
}

if (destroy_on_impact) {
	instance_destroy();
}