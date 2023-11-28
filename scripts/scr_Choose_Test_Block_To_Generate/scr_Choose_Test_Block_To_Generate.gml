///@desc Given a proc gen layout grid, and a location in it, decides what kind of block needs to go there
///@returns number corresponding to sprite to build, 0 corresponding to player start, or -1 for generate nothing
function scr_Choose_Test_Block_To_Generate(layout_grid, grid_x, grid_y){
	var room_string = ds_grid_get(layout_grid, grid_x, grid_y);
	
	//Set to a 3x3 room
	if(room_string == "b1c")
	{
		return spr_test_room;
	}
	else if(room_string == "s") //s marks the player start!
	{
		return 0;
	}
	else if(room_string == "1") //Decide what proc gen block to use
	{
		//Get all neighboring blocks
		var up_val = ds_grid_get(layout_grid, grid_x, grid_y +1);
		var down_val = ds_grid_get(layout_grid, grid_x, grid_y-1);
		var left_val = ds_grid_get(layout_grid, grid_x-1, grid_y);
		var right_val = ds_grid_get(layout_grid, grid_x+1, grid_y);
		
		var total_adjacent_proc_gen = 0;
		if(up_val == "1")
			total_adjacent_proc_gen++;
		if(down_val == "1")
			total_adjacent_proc_gen++;
		if(left_val == "1")
			total_adjacent_proc_gen++;
		if(right_val == "1")
			total_adjacent_proc_gen++;
			
		if(total_adjacent_proc_gen == 1) //This is the case that we must be connected to a combat room
		{
			if(up_val == "1") //Proc gen above us
			{
				if(down_val != "w")
				{
					//Combat room below
					return spr_ud1;
				}
				else if(left_val != "w")
				{
					//Combat room left
					return spr_ul1;
				}
				else if(right_val != "w")
				{
					//Combat room right
					return spr_ur1;
				}
			}
			else if(down_val == "1") //Proc gen block below
			{
				if(up_val != "w")
				{
					//Combat room above
					return spr_ud1;
				}
				else if(left_val != "w")
				{
					//Combat room left
					return spr_dl1;
				}
				else if(right_val != "w")
				{
					//Combat room right
					return spr_dr1;
				}
			}
			else if(left_val == "1") //Proc gen block left
			{
				if(up_val != "w")
				{
					//Combat room above
					return spr_ul1;
				}
				else if(down_val != "w")
				{
					//Combat room below
					return spr_dl1;
				}
				else if(right_val != "w")
				{
					//Combat room right
					return spr_lr;
				}
			}
			else if(right_val == "1") //proc gen right
			{
				if(up_val != "w") 
				{
					//Combat room above
					return spr_ur1;
				}
				else if(down_val != "w")
				{
					//Combat room below
					return spr_dr1;					
				}
				else if(left_val != "w")
				{
					//Combat room left
					return spr_lr;
				}
			}
		}
		else if(total_adjacent_proc_gen == 2) //Intermediate proc gen block forming a path
		{
			if(up_val == "1")
			{
				if(down_val == "1")
				{
					//Column block
					return spr_ud1;
				}
				else if(left_val == "1")
				{
					//Left and Up corner block
					return spr_ul1;
				}
				else if(right_val == "1")
				{
					//right and up corner block
					return spr_ur1;
				}
			}
			else if(down_val == "1")
			{
				//Don't worry about up down case, already checked
				if(left_val == "1")
				{
					//down and left corner block
					return spr_dl1;
				}
				else if(right_val == "1")
				{
					//down and right corner block
					return spr_dr1;					
				}
			}
			else if(left_val == "1")
			{
				//Only remaining case is a hallway block
				return spr_lr;
			}
			
		}
	}
	return -1; //No current valid block for the conditions
}