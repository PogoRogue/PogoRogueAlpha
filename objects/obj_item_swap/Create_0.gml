center_x = camera_get_view_width(view_camera[0])/2;
center_y = camera_get_view_height(view_camera[0])/2;
select = 1;
selected = false;
num_of_slots = 3;
select_sprite_keyboard = spr_arrow_up;
select_sprite_controller = spr_controller_button_bottom;
select_sprite = select_sprite_keyboard;
alpha = 1.25;
fade_away = false;
item1_name = "";
item2_name = "";


with obj_pause {
	paused_outside = true;
}

//shop
if room = room_shop {
	if instance_exists(obj_player) {
		center_x = obj_player.x;
	}	
}