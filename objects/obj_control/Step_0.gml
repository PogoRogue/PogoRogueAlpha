restart_button = keyboard_check_pressed(ord("R")) || gamepad_button_check_pressed(0,gp_start); //press R key to restart room
screenshake_button = keyboard_check_pressed(vk_backspace); //press escape key to restart room

if (restart_button) {
	game_restart(); //restart room
}

if (screenshake_button) {
	global.allow_screenshake = not global.allow_screenshake;
}

//last room
if room != room_shop {
	global.last_room = room;	
}