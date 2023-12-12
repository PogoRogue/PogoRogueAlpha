/// @description switch rooms
if (keyboard_check_pressed(vk_tab) || gamepad_button_check_pressed(0,gp_shoulderlb)) {
	if (room = room_proc_gen_test) {
		game_restart();
	} else if(room == room_boss_test) {
		
	} else if (room = room_sam_movement) {
		room = room_gym_enemy;
	} else if (room = room_gym_enemy) {
		room = room_fight_1;
	} else if (room = room_fight_1) {
		room = room_proc_gen_test;
	} else if (room = room_shop) {
		room = global.last_room;
	} 
	
	if (room = room_gameplay_video) {
		//temporarily commented out
		//room = room_boss_test;
	} else if (room = room_boss_test) {
		game_restart();
	}
}