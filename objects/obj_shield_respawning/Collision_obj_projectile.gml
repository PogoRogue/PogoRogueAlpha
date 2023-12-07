/// @description Deactivate shield

if(is_active){
	is_active = false;
	instance_destroy(other);
	alarm_set(0, 10 * room_speed);
}



