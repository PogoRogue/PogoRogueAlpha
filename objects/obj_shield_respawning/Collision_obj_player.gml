/// @description Deactivate shield

if(is_active){
	obj_player.state = obj_player.state_bouncing;
	obj_player.speed = 0;
	parent.speed = 0;
	is_active = false;
	alarm_set(0, 12 * room_speed); // Reactivate shield after 12 seconds
}




