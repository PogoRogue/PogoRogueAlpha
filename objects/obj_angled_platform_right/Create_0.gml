//temporary collision walls
//left
with instance_create_depth(x,y-sprite_height,depth-2,obj_wallleft) {
	image_xscale = 1/16;
	image_yscale = other.sprite_height/16;
}

//bottom
with instance_create_depth(x,y,depth-2,obj_wallbottom) {
	image_xscale = other.sprite_width/16;
	image_yscale = 1/16;
}

//top left corner
with instance_create_depth(x,y-sprite_height,depth-3,obj_walltopleftcorner) {
	image_xscale = 1/16;
	image_yscale = 1/16;
}

//top right corner
with instance_create_depth(x+sprite_width,y,depth-3,obj_walltoprightcorner) {
	image_angle = -45;
	image_xscale = sqrt(18);
	image_yscale = 1/16;
}