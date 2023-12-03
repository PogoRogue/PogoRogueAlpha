// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Create_Collision_Walls(){

	//top left corner
	with instance_create_depth(bbox_left,bbox_top,depth-3,obj_walltopleftcorner) {
		image_xscale = 0.5;
		image_yscale = 0.5;
	}

	//top right corner
	with instance_create_depth(bbox_right,bbox_top,depth-3,obj_walltoprightcorner) {
		image_xscale = 0.5;
		image_yscale = 0.5;
	}
}