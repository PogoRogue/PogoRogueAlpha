/// @description Check if left held
left_button = keyboard_check(vk_left) or keyboard_check(ord("A"))

if (left_button) {
	if (value > min_value) {
		value -= increment	
		alarm[0] = 3
	}else {
		value = min_value
	}
	event_user(0)
}