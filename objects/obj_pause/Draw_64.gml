if pause = true {
	gamepad_set_vibration(0,0,0);
	
	//darken screen
	draw_set_color(make_color_rgb(33,33,35));
	draw_set_alpha(0.75);
	draw_rectangle(0,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),false);
	draw_set_alpha(1);
	
	//draw pause button
	draw_sprite(spr_pause,0,16,camera_get_view_height(view_camera[0])-16);
}