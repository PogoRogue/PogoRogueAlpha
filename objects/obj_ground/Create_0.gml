/// @description create walls

//left
with instance_create_depth(bbox_left,bbox_top,depth-1,obj_wallleft) {
	image_xscale = 0.5
	image_yscale = other.image_yscale
}

//right
with instance_create_depth(bbox_right,bbox_top,depth-1,obj_wallright) {
	image_xscale = 0.5
	image_yscale = other.image_yscale
}

//bottom
with instance_create_depth(bbox_left,bbox_bottom,depth-1,obj_wallbottom) {
	image_xscale = other.image_xscale
	image_yscale = 0.5
}

//top left corner
with instance_create_depth(bbox_left,bbox_top,depth-2,obj_walltopleftcorner) {
	image_xscale = 0.5
	image_yscale = 0.5
}

//top right corner
with instance_create_depth(bbox_right,bbox_top,depth-2,obj_walltoprightcorner) {
	image_xscale = 0.5
	image_yscale = 0.5
}