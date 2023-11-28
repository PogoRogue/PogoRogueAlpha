/// @description Deactivate shield

if(is_active){
	obj_player.state = obj_player.state_bouncing;
	obj_player.speed = 0;
	parent.speed = 0;
	is_active = false;
	alarm_set(0, 10 * room_speed);
}




