if (keyboard_check_pressed(vk_tab)) {
	global.arm_cannon = not global.arm_cannon;
	room_restart();
}