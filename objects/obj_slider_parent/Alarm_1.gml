/// @description Check if right held
right_button = keyboard_check(vk_right) or keyboard_check(ord("D"));

if (right_button) {
	if (value_ < max_value) {
		value_ += increment;
		alarm[1] = 3;
	}else {
		value_ = max_value;
	}
	event_user(0);
}