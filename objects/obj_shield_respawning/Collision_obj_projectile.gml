/// @description Deactivate shield

if(is_active){
	is_active = false;
	instance_destroy(other);
	alarm_set(0, restore_duration);
	parent.current_iframes = 25;
}



