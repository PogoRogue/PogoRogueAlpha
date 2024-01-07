state();

//check if on screen for screen shake
if bbox_right > obj_camera.x-(obj_camera.view_w_half*1.5) and 
bbox_left < obj_camera.x+(obj_camera.view_w_half*1.5) and 
bbox_bottom > obj_camera.y-(obj_camera.view_h_half*1.5) and 
bbox_top < obj_camera.y+(obj_camera.view_h_half*1.5) {
	on_screen = true;
}else {
	on_screen = false;
}

//image index
if vertical = true {
	if grav > 0 {
		arrow_index = 0 + (4 * (floor(image_index) % 2 = 1));
	}else if grav < 0 {
		arrow_index = 1 + (4 * (floor(image_index) % 2 = 1));
	}
}else {
	if grav > 0 {
		arrow_index = 2 + (4 * (floor(image_index) % 2 = 1));
	}else if grav < 0 {
		arrow_index = 3 + (4 * (floor(image_index) % 2 = 1));
	}
}