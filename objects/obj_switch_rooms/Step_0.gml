/// @description switch rooms
if (keyboard_check_pressed(vk_tab) || gamepad_button_check_pressed(0,gp_select)) {
	if (room = room_proc_gen_test) {
		room = room_sam_movement;
	}else if (room = room_sam_movement) {
		room = room_gym_enemy;
	}else if (room = room_gym_enemy) {
		room = room_fight_1;
	} else if (room = room_fight_1) {
		room = room_proc_gen_test;
	} 
}