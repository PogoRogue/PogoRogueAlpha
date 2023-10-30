/// @description Check if left held
left_button = keyboard_check(vk_left) or keyboard_check(ord("A"));

if (left_button) {
	if (value_ > min_value) {
		value_ -= increment;
		alarm[0] = 3;
	}else {
		value_ = min_value;
	}
	event_user(0);
}