/// @description Initialize variables
value = 0
min_value = 0
max_value = 1
increment = 0.025
selected = false
image_speed = 0
image_index = 0

camera_object = obj_camera
cam = view_camera[0]
view_w_half = camera_get_view_width(cam) * 0.5
view_h_half = camera_get_view_height(cam) * 0.5

left_button = keyboard_check(vk_left) or keyboard_check(ord("A"))
right_button = keyboard_check(vk_right) or keyboard_check(ord("D"))
left_button_pressed = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))
right_button_pressed = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))

//customize these values in child objects
custom_min_value = 0
custom_max_value = 1
default_value = 0.5
custom_value = value
str = "Parent"

init_index = slider_index
draw_outline = false