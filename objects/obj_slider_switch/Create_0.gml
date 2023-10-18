/// @description Initialize variables
camera_object = obj_camera
cam = view_camera[0]
view_w_half = camera_get_view_width(cam) * 0.5
view_h_half = camera_get_view_height(cam) * 0.5

left_button = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))
right_button = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))

custom_value = obj_player.use_mouse
str = "Controls"
string_false = "Keyboard"
string_true = "Mouse"
draw_outline = false