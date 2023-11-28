/// @description Deactivate shield

if(is_active){
	is_active = false;
	alarm_set(0, 10 * room_speed);
}



