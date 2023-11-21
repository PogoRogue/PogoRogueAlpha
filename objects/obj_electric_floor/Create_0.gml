/// @description Create Electric Floor
power_on = false;
cycle_time = 2;
powering_up_time = 1;
alarm[0] = room_speed * cycle_time;

//left
with instance_create_depth(bbox_left+1,bbox_top+2,depth-1,obj_wallleft) {
	image_xscale = 0.5;
	image_yscale = other.image_yscale-.2;
}

//right
with instance_create_depth(bbox_right-1,bbox_top+2,depth-1,obj_wallright) {
	image_xscale = 0.5;
	image_yscale = other.image_yscale-.2;
}

//bottom
with instance_create_depth(bbox_left+1,bbox_bottom-1,depth-1,obj_wallbottom) {
	image_xscale = other.image_xscale-.2;
	image_yscale = 0.5;
}

//top left corner
with instance_create_depth(bbox_left+1,bbox_top+2,depth-2,obj_walltopleftcorner) {
	image_xscale = 0.5;
	image_yscale = 0.5;
}

//top right corner
with instance_create_depth(bbox_right-1,bbox_top+2,depth-2,obj_walltoprightcorner) {
	image_xscale = 0.5;
	image_yscale = 0.5;
}
