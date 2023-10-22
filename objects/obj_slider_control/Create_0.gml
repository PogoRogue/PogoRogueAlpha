/// @description Initialize variables
global.slider_index = 0
global.use_mouse_for_slider = true
number_of_sliders = 7 //instance_number(obj_slider_parent)

up_button = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"))
down_button = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"))