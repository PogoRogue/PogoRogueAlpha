/// @description Bounce off of enemy and kill it

if(!other.is_dead) {
	bouncing = true;
	other.hp = 0;
	while(place_meeting(x, y, obj_enemy_shoot_only)) {
		y--;	
	}
}




