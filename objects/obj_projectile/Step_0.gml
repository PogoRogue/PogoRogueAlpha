//destroy when touching ground
if (destroy_on_impact) {
	if (place_meeting(x,y,obj_ground)) {
		instance_destroy()
	}

}