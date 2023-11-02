/// @description Damage enemy

if(!other.is_dead && other.current_iframes <= 0) {
	other.hp -= damage;
	other.red_frames = 10;
}

instance_destroy();
