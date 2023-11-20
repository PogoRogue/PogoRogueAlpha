/// @description On destroy

//create bubble pop
if (gun_name = "Bubble Gun") {
	instance_create_depth(x,y,depth,obj_projectile_bubble_pop);
}

//create explosion
if (gun_name = "Grenade Launcher") {
	if instance_exists(obj_camera) {
		var camera_width = camera_get_view_width(view_camera[0])/2;
		var camera_height = camera_get_view_height(view_camera[0])/2;
		var padding = 64;
		
		if (point_in_rectangle(x,y,obj_camera.x-camera_width-padding,obj_camera.y-camera_height-padding,obj_camera.x+camera_width+padding,obj_camera.y+camera_height+padding)) {
			instance_create_depth(x,y,depth,obj_projectile_explosion);
		}
	}
}