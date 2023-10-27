/// @description Update camera

//Update destination
if (instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y - 32;

	//Update object position
	x += (xTo - x) / readjust_speed;
	y += (yTo - y) / readjust_speed;
	
	x = clamp(x,view_w_half,room_width - view_w_half);
	y = clamp(y,view_h_half,room_height - view_h_half);

}

camera_set_view_pos(cam,x-view_w_half,y-view_h_half);