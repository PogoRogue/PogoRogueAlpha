/// @description Draw tiles
var padding = camera_get_view_width(view_camera[0])/2 + 64;
//only draw if in frame to reduce lags
if (point_in_rectangle(x,y,obj_camera.x-padding,obj_camera.y-padding,obj_camera.x+padding,obj_camera.y+padding)) {
	draw_tile(tileset,tile_frame,0,x,y);
}