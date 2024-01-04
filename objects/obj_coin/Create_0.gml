/// @description Initialize variables

randomize();
start_spd = 0; //starting speed
spd = start_spd;
max_spd = random_range(6,10); //max speed
follow_object = obj_player;
follow_object2 = obj_player_mask;

if room = room_shop {
	global.num_of_coins -= 1;
}

damage = 2;
init_damage = damage;
colliding_with_enemies = false;