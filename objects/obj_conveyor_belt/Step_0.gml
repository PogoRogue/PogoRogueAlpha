/// @description create walls
var padding = camera_get_view_width(view_camera[0])/2 + 64;
//only draw if in frame to reduce lags
if (distance_to_object(obj_player) < 96) {
	//create collision walls
	if created_walls = false {
		scr_Create_Collision_Walls();
		created_walls = true;
	}
}else {
	created_walls = false;
}