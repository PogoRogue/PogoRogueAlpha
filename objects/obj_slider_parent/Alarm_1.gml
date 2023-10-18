/// @description Check if right held
right_button = keyboard_check(vk_right) or keyboard_check(ord("D"))

if (right_button) {
	if (value < max_value) {
		value += increment	
		alarm[1] = 3
	}else {
		value = max_value
	}
	event_user(0)
}