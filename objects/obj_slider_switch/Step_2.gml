/// @description set x/y position
if (instance_exists(camera_object)) {
	x = camera_object.x - view_w_half + 56
	y = camera_object.y - view_h_half + 32 + (slider_index*32)
}

left_button = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))
right_button = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))

if (global.use_mouse_for_slider) {
	if (mouse_check_button_pressed(mb_left)) {
		if (point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom)) {
			custom_value = !custom_value
			event_user(0)
			draw_outline = true
		}
	}
	
	if (point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom)) {
		draw_outline = true
	}else {
		draw_outline = false
	}
}else if (global.slider_index = slider_index) {

	if (left_button) {
		custom_value = false
		event_user(0)
	}

	if (right_button) {
		custom_value = true
		event_user(0)
	}
	draw_outline = false
	
}else {
	draw_outline = false
}


