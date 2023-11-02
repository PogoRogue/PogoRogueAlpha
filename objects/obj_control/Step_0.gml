restart_button = keyboard_check_pressed(ord("R")) || gamepad_button_check_pressed(0,gp_start); //press R key to restart room
endgame_button = keyboard_check_pressed(vk_escape); //press escape key to restart room

if (restart_button) {
	room_restart(); //restart room
}

if (endgame_button) {
	game_end(); //close application
}