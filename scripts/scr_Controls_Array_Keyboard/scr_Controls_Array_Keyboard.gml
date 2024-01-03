// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Controls_Array_Keyboard(){
	//ARRAY VALUES
	//player controls
	array_key_right_player = [keyboard_check(ord("D")),keyboard_check(vk_right)];
	array_key_left_player = [keyboard_check(ord("A")),keyboard_check(vk_left)];
	array_key_right_pressed_player = [keyboard_check_pressed(ord("D")),keyboard_check_pressed(vk_right)];
	array_key_left_pressed_player = [keyboard_check_pressed(ord("A")),keyboard_check_pressed(vk_left)];
	array_key_fire_projectile = [keyboard_check(vk_space),0];
	array_key_recenter = [keyboard_check(ord("W")),keyboard_check(vk_up)];
	array_key_fire_projectile_pressed = [keyboard_check_pressed(vk_space),0];
	array_key_fire_projectile_released = [keyboard_check_released(vk_space),0];
	array_key_pickup_1 = [mouse_check_button(mb_left),0];
	array_key_pickup_2 = [mouse_check_button(mb_right),0];
	array_key_pickup_1_pressed = [mouse_check_button_pressed(mb_left),0];
	array_key_pickup_2_pressed = [mouse_check_button_pressed(mb_right),0];
	array_key_interact = [keyboard_check_pressed(ord("E")),0];
	array_key_weapon_1 = [keyboard_check_pressed(ord("1")),0];
	array_key_weapon_2 = [keyboard_check_pressed(ord("2")),0];
	array_key_weapon_3 = [keyboard_check_pressed(ord("3")),0];
	array_key_weapon_up = [mouse_wheel_up(),0]; 
	array_key_weapon_down = [mouse_wheel_down(),0];

	//menus
	array_key_right_menu = [keyboard_check(ord("D")),keyboard_check(vk_right)];
	array_key_left_menu = [keyboard_check(ord("A")),keyboard_check(vk_left)];
	array_key_down_menu = [keyboard_check(ord("S")),keyboard_check(vk_down)];
	array_key_up_menu = [keyboard_check(ord("W")),keyboard_check(vk_up)];
	array_key_right_pressed_menu = [keyboard_check_pressed(ord("D")),keyboard_check_pressed(vk_right)];
	array_key_left_pressed_menu = [keyboard_check_pressed(ord("A")),keyboard_check_pressed(vk_left)];
	array_key_down_pressed_menu = [keyboard_check_pressed(ord("S")),keyboard_check_pressed(vk_down)];
	array_key_up_pressed_menu = [keyboard_check_pressed(ord("W")),keyboard_check_pressed(vk_up)];
	array_key_pause = [keyboard_check_pressed(vk_escape),keyboard_check_pressed(ord("P"))];
	array_key_back = [keyboard_check_pressed(vk_escape),0];
	array_key_item_menu = [keyboard_check_pressed(vk_tab),0];
	array_key_select = [keyboard_check_pressed(vk_enter),keyboard_check_pressed(vk_space)];
}