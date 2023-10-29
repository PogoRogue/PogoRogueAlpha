image_index = 1; //flash effect

x += lengthdir_x(spd,image_angle);
y += lengthdir_y(spd,image_angle);

var padding = 64;
if !(point_in_rectangle(x,y,-padding,-padding,room_width+padding,room_height+padding)) {
	instance_destroy(); //destroy if outside room
}

//destroy when touching ground
if (destroy_on_impact) {
	if (place_meeting(x,y,obj_ground)) {
		instance_destroy();
	}
}