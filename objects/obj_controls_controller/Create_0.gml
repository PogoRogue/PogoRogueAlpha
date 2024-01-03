global.use_keyboard = false;
global.use_controller = true;

if instance_number(obj_controls_controller) > 1 {
	instance_destroy();	
}

scr_Controls_Array_Controller();

//ACTUAL VARIABLES TO CHECK INPUTS
//player controls
global.key_right_player = 0;
global.key_left_player = 0;
global.key_right_pressed_player = 0;
global.key_left_pressed_player = 0;
global.key_fire_projectile = 0;
global.key_recenter = 0;
global.key_fire_projectile_pressed = 0;
global.key_fire_projectile_released = 0;
global.key_pickup_1 = 0;
global.key_pickup_2 = 0;
global.key_pickup_1_pressed = 0;
global.key_pickup_2_pressed = 0;
global.key_interact = 0;
global.key_weapon_1 = 0;
global.key_weapon_2 = 0;
global.key_weapon_3 = 0;
global.key_weapon_up = 0;
global.key_weapon_down = 0;

//menus
global.key_right_menu = 0;
global.key_left_menu = 0;
global.key_down_menu = 0;
global.key_up_menu = 0;
global.key_right_pressed_menu = 0;
global.key_left_pressed_menu = 0;
global.key_down_pressed_menu = 0;
global.key_up_pressed_menu = 0;
global.key_pause = 0;
global.key_back = 0;
global.key_item_menu = 0;
global.key_select = 0;