/// @description Draw health cells either full or empty

display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));

for(var _i = 0; _i < max_hp; _i += 8) {
	if (_i < hp) {
		draw_sprite(spr_heart_ui, 0, 8 + (_i * 3), 32);
	} else {
		draw_sprite(spr_heart_ui, 1, 8 + (_i * 3), 32);
	}
}