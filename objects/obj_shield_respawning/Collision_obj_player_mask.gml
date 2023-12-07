/// @description Player should bounce off shield

if(is_active) {
	with(obj_player) {
		hspeed = -2 * sign(hspeed);
		vspeed = 0;
		
		x += hspeed;
		y += vspeed;
	}
	is_active = false;
	alarm_set(0, 10);
}
