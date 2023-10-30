/// @description set x and y value
if (instance_exists(camera_object)) {
	x = camera_object.x - view_w_half + 32;
	y = camera_object.y - view_h_half + 32 + (slider_index*32);
}

if (global.use_mouse_for_slider) {
	var button_x = x + sprite_width*value_;
	var button_y = y;
	var button_radius = sprite_get_width(spr_slider_button)/2;
	//draw outline for mouse mode
	if (point_in_circle(mouse_x,mouse_y,button_x,button_y,button_radius)) {
		draw_outline = true;
	}else {
		draw_outline = false;
	}
}

