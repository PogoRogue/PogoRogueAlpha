/// @description Set controls
if (instance_exists(obj_player)) {
	obj_player.use_mouse = value
	global.use_mouse_for_slider = !value
}

if (value) {
	window_set_cursor(spr_nothing)
	cursor_sprite = spr_nothing
	global.slider_index = slider_index
}else {
	window_set_cursor(spr_cursor)
	cursor_sprite = spr_cursor
}