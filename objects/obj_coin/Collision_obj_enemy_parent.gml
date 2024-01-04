if global.flaming_coins = true and colliding_with_enemies = false {
	if(!other.is_dead) {
		other.hp -= damage;
		other.red_frames = 10;
		scr_Reload_On_Kill();
		colliding_with_enemies = true;
	}
}