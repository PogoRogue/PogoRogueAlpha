if pause = true {
	gamepad_set_vibration(0,0,0);
	
	//draw pause button
	draw_sprite(spr_pause,0,16,camera_get_view_height(view_camera[0])-16);
}