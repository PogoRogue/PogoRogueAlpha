/// @description Damage enemy

if(!other.is_dead && other.current_iframes <= 0) {
	other.hp -= damage;
	other.red_frames = 10;
}

if (destroy_on_impact) {
	instance_destroy();
}