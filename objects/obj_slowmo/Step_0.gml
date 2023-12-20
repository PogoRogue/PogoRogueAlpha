if slow_time = true and room_speed > slow_mo_speed {
	room_speed -= 1;
}else if slow_time = true {
	slow_time = false;
	alarm[0] = time;
}

if speedup_time = true and room_speed < init_room_speed {
	room_speed += 1;
}else if speedup_time = true {
	instance_destroy();
}