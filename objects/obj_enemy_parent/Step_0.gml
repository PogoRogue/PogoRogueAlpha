/// @description Movement and state changes

//death
if (hp == 0) {
	instance_destroy();
}

is_grounded = instance_place(x, y, [obj_ground_parent]);
if (is_grounded <= 0) {
	vspeed = 3;
	is_falling = instance_place(x, y+vspeed, [obj_ground_parent]);
	if (is_falling > 0) {
		vspeed=0
	}
}
