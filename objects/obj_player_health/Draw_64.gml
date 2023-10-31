/// @description Draw health cells either full or empty

display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));

for(var _i = 0; _i < max_hp; _i += 8) {
	if (_i < hp) {
		draw_sprite(spr_player_health, 0, 16 + (_i * 2), 16);
	} else {
		draw_sprite(spr_player_health_empty, 0, 16 + (_i * 2), 16);
	}
}



