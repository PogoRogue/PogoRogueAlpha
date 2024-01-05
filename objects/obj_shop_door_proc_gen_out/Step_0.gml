event_inherited();

//Set key check to these keys since this door is not in the shop
key_open_door = keyboard_check_pressed(ord("W")) + keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0,gp_face4);

//check for button press
if (colliding and key_open_door) {
	if(instance_exists(obj_shop_door_proc_gen_in))
	{
		var inner_door = instance_nearest(x,y,obj_shop_door_proc_gen_in)
		//Set the inner door's previous position to this door's, so we can return the 
		//player here when they exit the shop
		inner_door.player_x_prev = x;
		inner_door.player_y_prev = y;
		
		var inner_door_x = inner_door.x;
		var inner_door_y = inner_door.y;
		
		//Teleport the player to the inner shop door position
		if(instance_exists(obj_player))
		{
			var temp_player = instance_nearest(x,y,obj_player);
			temp_player.x = inner_door_x;
			temp_player.y = inner_door_y;
		}
	}
}