/// @description Set up camera
cam = view_camera[0]
follow = obj_player
x = follow.x
y = follow.y
view_w_half = camera_get_view_width(cam) * 0.5
view_h_half = camera_get_view_height(cam) * 0.5
xTo = xstart
yTo = ystart
readjust_speed = 12 //lower = faster
x_adjust = 100

scroll = 0