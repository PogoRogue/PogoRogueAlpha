/// @description Damage enemy

if(!other.is_dead && other.current_iframes <= 0) {
	other.hp -= damage;
	other.red_frames = 10;
	
	scr_Reload_On_Kill();
}