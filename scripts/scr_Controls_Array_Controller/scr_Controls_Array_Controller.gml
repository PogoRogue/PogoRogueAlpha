// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Controls_Array_Controller(){
	//ARRAY VALUES
	//player controls
	array_key_right_player = [gamepad_axis_value(0,gp_axislh) > 0.5,0];
	array_key_left_player = [gamepad_axis_value(0,gp_axislh) < -0.5,0];
	array_key_right_pressed_player = [gamepad_axis_value(0,gp_axislh) > 0.5,0];
	array_key_left_pressed_player = [gamepad_axis_value(0,gp_axislh) < -0.5,0];
	array_key_fire_projectile = [gamepad_button_check(0,gp_shoulderrb),0];
	array_key_recenter = [gamepad_axis_value(0,gp_axislv) < -0.65,0];
	array_key_fire_projectile_pressed = [gamepad_button_check_pressed(0,gp_shoulderrb),0];
	array_key_fire_projectile_released = [gamepad_button_check_released(0,gp_shoulderrb),0];
	array_key_pickup_1 = [gamepad_button_check(0,gp_face1),0];
	array_key_pickup_2 = [gamepad_button_check(0,gp_face2),0];
	array_key_pickup_1_pressed = [gamepad_button_check_pressed(0,gp_face1),0];
	array_key_pickup_2_pressed = [gamepad_button_check_pressed(0,gp_face2),0];
	array_key_interact = [gamepad_button_check_pressed(0,gp_face4),0];
	array_key_weapon_1 = [0,0];
	array_key_weapon_2 = [0,0];
	array_key_weapon_3 = [0,0];
	array_key_weapon_up = [gamepad_button_check_released(0,gp_shoulderr),0];
	array_key_weapon_down = [gamepad_button_check_released(0,gp_shoulderl),0];

	//menus
	array_key_right_menu = [gamepad_axis_value(0,gp_axislh) > 0.5,0];
	array_key_left_menu = [gamepad_axis_value(0,gp_axislh) < -0.5,0];
	array_key_down_menu = [gamepad_axis_value(0,gp_axislv) > 0.5,0];
	array_key_up_menu = [gamepad_axis_value(0,gp_axislv) < -0.5,0];
	array_key_right_pressed_menu = [gamepad_axis_value(0,gp_axislh) > 0.5,0];
	array_key_left_pressed_menu = [gamepad_axis_value(0,gp_axislh) < -0.5,0];
	array_key_down_pressed_menu = [gamepad_axis_value(0,gp_axislv) > 0.5,0];
	array_key_up_pressed_menu = [gamepad_axis_value(0,gp_axislv) < -0.5,0];
	array_key_pause = [gamepad_button_check_pressed(0,gp_start),0];
	array_key_back = [gamepad_button_check_pressed(0,gp_face2),gamepad_button_check_pressed(0,gp_start)];
	array_key_item_menu = [gamepad_button_check_pressed(0,gp_select),0];
	array_key_select = [gamepad_button_check_pressed(0,gp_face1),0];
}