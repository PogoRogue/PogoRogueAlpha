/// @description Set up camera
cam = view_camera[0];
follow = obj_player;
x = follow.x;
y = follow.y-32;
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

xTo = xstart;
yTo = ystart;
xTo2 = xstart;
yTo2 = ystart;

x_min = xTo;
x_max = xTo;
y_min = yTo;
y_max = yTo;
	
x_clamp = false;
y_clamp = false;

readjust_speed = 8; //lower = faster
x_adjust = 100;

scroll = 0;

//screen shake
shake_length = 0; //# of frames
shake_magnitude = 0; //# of pixels in each direction, max value
shake_remain = 0; //decrease this value until it reaches zero
buff = 0; //buffer

if !instance_exists(obj_control) {
	instance_create_depth(x,y,depth,obj_control);
}

//state variable for being in the proc gen shop or not
in_shop = false;