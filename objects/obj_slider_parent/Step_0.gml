/// @description Check if no longer select
left_button_pressed = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
right_button_pressed = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));

if (global.use_mouse_for_slider = true) {
	if (mouse_check_button_pressed(mb_left)) {
		var button_x = x + sprite_width*value_;
		var button_y = y;
		var button_radius = sprite_get_width(spr_slider_button)/2;
		if (point_in_circle(mouse_x,mouse_y,button_x,button_y,button_radius)) {
			selected = true;
		}
	}

	if !(mouse_check_button(mb_left)) {
		selected = false;
	}

	if (selected) {
		value_ = clamp((mouse_x-x)/sprite_width,min_value,max_value);
		event_user(0);
	}
}else if (global.slider_index = slider_index) {
	
	if (left_button_pressed) {
		if (value_ > min_value) {
			value_ -= increment;
			alarm[0] = 15;
		}else {
			value_ = min_value;
		}
		event_user(0);
	}
	
	if (right_button_pressed) {
		if (value_ < max_value) {
			value_ += increment;
			alarm[1] = 15;
		}else {
			value_ = max_value;
		}
		event_user(0);
	}
	
}

//hide slider if not appicable
if (global.use_mouse_for_slider and mouse_only)
or !(global.use_mouse_for_slider) and (keyboard_only) {
	slider_index = -100;
}else if (slider_index = -100) {
	slider_index = init_index;
}

//disable
if (disable_sliders) {
	instance_destroy();
	with obj_presets {
		instance_destroy();
	}
}