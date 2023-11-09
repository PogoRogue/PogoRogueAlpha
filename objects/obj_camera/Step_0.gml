/// @description Update camera

//Update destination
if (instance_exists(follow)) {
	//update destination
	xTo = follow.x;
	yTo = follow.y - 32;

	//Update object position
	x += (xTo - x) / readjust_speed;
	y += (yTo - y) / readjust_speed;
	
	//center in room
	//x = clamp(x,view_w_half+buff,room_width - view_w_half-buff);
	//y = clamp(y,view_h_half+buff,room_height - view_h_half-buff);

}

//screen shake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

//vibrate controller
gamepad_set_vibration(0, shake_remain/4, shake_remain/4);

//update camera view
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

