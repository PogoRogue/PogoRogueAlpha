function scr_Convert_Layout_To_Rooms(layout_grid){
	var test_room_sprite = spr_u1;
	var block_grid_size  = sprite_get_width(test_room_sprite); //assumes square blocks
	var block_room_size = block_grid_size * 16;
	
	for(var j = 0; j < ds_grid_height(layout_grid); j++)
	{
		for(var i = 0; i < ds_grid_width(layout_grid); i++)
		{
			if(ds_grid_get(layout_grid, i, j) != 0)
			{
				var x_offset = block_room_size * i;
				var y_offset = block_room_size * j;
				//Create each block with the proper offset
				scr_Create_Room_From_Sprite(spr_u195, x_offset, y_offset);
			}
		}
	}
}