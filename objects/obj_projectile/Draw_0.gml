//draw trail
if (gun_name = "Bouncy Ball Blaster") {
	draw_self();
	image_angle = direction;
	with instance_create_depth(x,y,depth+1,obj_bbb_trail) {
		image_index = other.num_of_bounces+2;
		image_alpha = 0.95;
	}
}else {
	draw_self();
}