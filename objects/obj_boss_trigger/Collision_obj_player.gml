/// @description Draw cutin

if(!triggered) {
	triggered = true;
	draw_cutin = true;
	alarm_set(0, 5 * room_speed); // Initiate despawn
}
