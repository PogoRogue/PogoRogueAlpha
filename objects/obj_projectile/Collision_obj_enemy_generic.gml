/// @description Damage enemy

if(!other.is_dead && other.current_i_frames <= 0) {
	other.hp -= damage;
	other.red_frames = 10;
}

instance_destroy();
