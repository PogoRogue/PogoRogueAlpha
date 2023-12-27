if global.hot_shells = true {
	if(!other.is_dead) {
		other.hp -= (8 + obj_player.damage_buff) * other.bullet_defense;
		other.red_frames = 10;
		scr_Reload_On_Kill();
		instance_destroy();
	}
}