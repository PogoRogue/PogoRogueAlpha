/// @description Set controls
if (instance_exists(obj_player)) {
	obj_player.use_mouse = custom_value;
	global.use_mouse_for_slider = !custom_value;
}

if (custom_value) {
	window_set_cursor(spr_nothing);
	cursor_sprite = spr_nothing;
	global.slider_index = 0;
}else {
	window_set_cursor(spr_cursor);
	cursor_sprite = spr_cursor;
}