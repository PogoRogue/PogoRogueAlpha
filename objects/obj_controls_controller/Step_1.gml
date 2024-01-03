if scr_Gamepad_Check_Input() > 0 {
	global.use_keyboard = false;
	global.use_controller = true;	
}

scr_Controls_Array_Controller();

//get all possible controls
if global.use_controller = true {
	//player controls
	global.key_right_player = array_key_right_player[0] || array_key_right_player[1];
	global.key_left_player = array_key_left_player[0] || array_key_left_player[1];
	global.key_right_pressed_player = array_key_right_pressed_player[0] || array_key_right_pressed_player[1];
	global.key_left_pressed_player = array_key_left_pressed_player[0] || array_key_left_pressed_player[1];
	global.key_fire_projectile = array_key_fire_projectile[0] || array_key_fire_projectile[1];
	global.key_recenter = array_key_recenter[0] || array_key_recenter[1];
	global.key_fire_projectile_pressed = array_key_fire_projectile_pressed[0] || array_key_fire_projectile_pressed[1];
	global.key_fire_projectile_released = array_key_fire_projectile_released[0] || array_key_fire_projectile_released[1];
	global.key_pickup_1 = array_key_pickup_1[0] || array_key_pickup_1[1];
	global.key_pickup_2 = array_key_pickup_2[0] || array_key_pickup_2[1];
	global.key_pickup_1_pressed = array_key_pickup_1_pressed[0] || array_key_pickup_1_pressed[1];
	global.key_pickup_2_pressed = array_key_pickup_2_pressed[0] || array_key_pickup_2_pressed[1];
	global.key_interact = array_key_interact[0] || array_key_interact[1];
	global.key_weapon_1 = array_key_weapon_1[0] || array_key_weapon_1[1];
	global.key_weapon_2 = array_key_weapon_2[0] || array_key_weapon_2[1];
	global.key_weapon_3 = array_key_weapon_3[0] || array_key_weapon_3[1];
	global.key_weapon_up = array_key_weapon_up[0] || array_key_weapon_up[1];
	global.key_weapon_down = array_key_weapon_down[0] || array_key_weapon_down[1];

	//menus
	global.key_right_menu = array_key_right_menu[0] || array_key_right_menu[1];
	global.key_left_menu = array_key_left_menu[0] || array_key_left_menu[1];
	global.key_down_menu = array_key_down_menu[0] || array_key_down_menu[1];
	global.key_up_menu = array_key_up_menu[0] || array_key_up_menu[1];
	global.key_right_pressed_menu = array_key_right_pressed_menu[0] || array_key_right_pressed_menu[1];
	global.key_left_pressed_menu = array_key_left_pressed_menu[0] || array_key_left_pressed_menu[1];
	global.key_down_pressed_menu = array_key_down_pressed_menu[0] || array_key_down_pressed_menu[1];
	global.key_up_pressed_menu = array_key_up_pressed_menu[0] || array_key_up_pressed_menu[1];
	global.key_pause = array_key_pause[0] || array_key_pause[1];
	global.key_back = array_key_back[0] || array_key_back[1];
	global.key_item_menu = array_key_item_menu[0] || array_key_item_menu[1];
	global.key_select = array_key_select[0] || array_key_select[1];
}