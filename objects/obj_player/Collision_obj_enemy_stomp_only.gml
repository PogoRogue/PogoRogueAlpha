/// @description Bounce off of enemy and kill it

if(!other.is_dead) {
	state = state_bouncing;
	speed = 0;
	other.hp = 0;
	while(place_meeting(x, y, obj_enemy_shoot_only)) {
		y--;	
	}
}




