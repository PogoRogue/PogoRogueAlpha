/// @description Bounce off of enemy

if(!other.is_dead) {
	bouncing = true;
	while(place_meeting(x, y, obj_enemy_shoot_only)) {
		y--;	
	}
}




