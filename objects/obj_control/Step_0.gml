restart_button = keyboard_check_pressed(ord("R")) //press R key to restart room
endgame_button = keyboard_check_pressed(vk_escape) //press escape key to restart room

if (restart_button) {
	room_restart() //restart room
}

if (endgame_button) {
	game_end() //close application
}