event_inherited();

//Set these keys since this door is inside the shop
key_open_door = keyboard_check_pressed(vk_tab) || gamepad_button_check_pressed(0,gp_face4);

//check for button press
if (colliding and key_open_door) {
	//Teleport the player back to the door they entered the shop from
	if(instance_exists(obj_player))
	{
		var temp_player = instance_nearest(x,y,obj_player);
		temp_player.x = player_x_prev;
		temp_player.y = player_y_prev;
	}
}