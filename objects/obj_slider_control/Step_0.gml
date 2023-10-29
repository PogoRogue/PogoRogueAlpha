/// @description Switch sliders
up_button = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
down_button = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));

if (global.use_mouse_for_slider = false) {

	if (up_button) {
		if (global.slider_index > 0) {
			global.slider_index -= 1;
		}
	}

	if (down_button) {
		if (global.slider_index < number_of_sliders-1) {
			global.slider_index += 1;
		}
	}
	
}else {
	global.slider_index = 1000;
}