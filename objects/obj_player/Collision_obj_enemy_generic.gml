/// @description Bounce off of enemy and damage it

if(!other.is_dead && other.current_i_frames <= 0) {
	state = state_bouncing;
	speed = 0;
	other.hp -= stomp_damage;
	other.red_frames = 10;
	other.current_i_frames = other.num_i_frames;
}
