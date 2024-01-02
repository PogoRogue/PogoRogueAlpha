center_x = camera_get_view_width(view_camera[0])/2;
center_y = camera_get_view_height(view_camera[0])/2;
select = 1;
selected = false;
if obj_player.weapons_equipped = 1 or obj_player.weapons_equipped = 2 {
	num_of_slots = 3;
}else if obj_player.weapons_equipped = 3 {
	num_of_slots = 4;
}
select_sprite_keyboard = spr_arrow_up;
select_sprite_controller = spr_controller_button_bottom;
select_sprite = select_sprite_keyboard;
alpha = 1.25;
fade_away = false;
item1_name = "";
item2_name = "";
item3_name = "";

with obj_pause {
	paused_outside = true;
}