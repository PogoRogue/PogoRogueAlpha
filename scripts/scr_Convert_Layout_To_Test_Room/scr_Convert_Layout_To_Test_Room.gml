function scr_Convert_Layout_To_Test_Room(layout_grid){
	var test_room_sprite = spr_u1;
	var block_grid_size  = sprite_get_width(test_room_sprite); //assumes square blocks
	var block_room_size = block_grid_size * 16;
	
	for(var j = ds_grid_height(layout_grid) - 1; j >= 0; j--)
	{
		for(var i = 0; i < ds_grid_width(layout_grid); i++)
		{
			var x_offset = block_room_size * i;
			var y_offset = -1 * block_room_size * j; //Negative since gamemaker y coords decrease upwards
			if(ds_grid_get(layout_grid, i, j) != 0)
			{	
				if(ds_grid_get(layout_grid, i, j) == "w")
				{
					//Generate large wall to fill block
					//Don't necessarilly need to fill the entire grid this way, only the borders of the rooms
					//For now just fill the whole grid with wall blocks
					var wall = instance_create_depth(x_offset, y_offset, depth, obj_ground_outer, 
					{
						image_xscale : block_grid_size,
						image_yscale : block_grid_size
					});
				}
				else
				{
					//Create each block with the proper offset
					var block_to_generate = scr_Choose_Test_Block_To_Generate(layout_grid, i, j);
					if(block_to_generate != -1)
					{
						if(block_to_generate == 0)
						{
							//Move the player to this location
							if(instance_exists(obj_player))
							{
								var player = instance_nearest(x,y,obj_player);
								if(instance_exists(obj_player_start))
								{
									var player_start_location = instance_nearest(x_offset + block_room_size/2,
																				 y_offset + block_room_size/2,obj_player_start);
									player.x = player_start_location.x;
									player.y = player_start_location.y;
								}
								else
								{
								player.x = x_offset + block_room_size/2;
								player.y = y_offset + block_room_size/2;
								}
								with obj_camera {
									x = player.x;
									y = player.y - 32;
								}								
								show_debug_message("Moved player!")
							}
							else
							{
								show_debug_message("Didn't move player!")
							}
						}
						else
						{
							var sub_image_num = sprite_get_number(block_to_generate);
							var sub_image_to_make = irandom_range(0,sub_image_num - 1);
							scr_Create_Room_From_Sprite(block_to_generate, sub_image_to_make, x_offset, y_offset);
						}
					}	
				}
			}
		}
	}
}