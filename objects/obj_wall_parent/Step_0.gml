/// @description delete if out of view
if room = room_proc_gen_test {
	//only draw if in frame to reduce lags
	if (distance_to_object(obj_player) >= 96) {
		instance_destroy();	
	}
}




