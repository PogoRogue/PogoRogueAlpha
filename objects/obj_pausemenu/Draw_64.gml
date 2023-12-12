/// @description draw self
if !instance_exists(obj_popup_restart) and !instance_exists(obj_popup_exit) {
	var xx = camera_get_view_width(view_camera[0])/2;
	var yy = camera_get_view_height(view_camera[0])/2;
	draw_sprite(sprite_index,image_index,xx,yy);
}