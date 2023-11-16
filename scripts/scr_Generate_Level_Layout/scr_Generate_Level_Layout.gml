function scr_Generate_Level_Layout(room_number, max_gen_width, prebuilt_rooms)
{

	// Create a grid to hold our layout
	var grid_height = 10;
	var grid_width = max_gen_width;

	var layout_grid = ds_grid_create(grid_width + 1, grid_height + 1); // +1 since we start at 0

	// Print what seed we're currently on
	var seed = randomize();
	show_debug_message("Random seed: " + string(seed));

	var currentY = 1; //Start above the bottom of the grid so that we can put walls below it
	var currentX = 0;

	ds_list_shuffle(prebuilt_rooms); // Shuffle our rooms, THIS IS SEEDED!

	var previous_room = -1;

	for (var rCount = 0; rCount < room_number; rCount++) {
	    var room_index = choose(0);//, 1, 2, 3); // Pick a random prebuilt_room
	    var r = ds_list_find_value(prebuilt_rooms, room_index);
	    var rWidth = r[0];
	    var rHeight = r[1];
	    var room_id = r[2];
	    //show_debug_message("Y: " + string(currentY));
	    currentX = irandom_range(1, grid_width - rWidth - 1); // Random X axis placement 
		//within room with at least 1 space between room and grid edge

	    // Ensure rooms are in the grid bounds
	    if (!(
	        currentY >= 0 &&
	        currentX >= 0 &&
	        currentY + rHeight <= grid_height + 1 &&
	        currentX + rWidth <= grid_width
	    )) {
				ds_grid_resize(layout_grid, grid_width+1, (grid_height*2)+1);
				grid_height *= 2;
			}
		// Connect the rooms with winding paths
	    if (previous_room != -1) {
	        Connect_Rooms(layout_grid, previous_room[0], previous_room[1]+rHeight, previous_room[2], previous_room[3], currentX, currentY, rWidth, rHeight);
	    }

	    // Place the current room
	    for (var roomX = currentX; roomX < currentX + rWidth; roomX++) {
	        for (var roomY = currentY; roomY < currentY + rHeight; roomY++) {
	            ds_grid_set(layout_grid, roomX, roomY, room_id);
				//Mark corners of rooms
				if(roomX == currentX && roomY == currentY + rHeight - 1)
				{
					ds_grid_set(layout_grid, roomX, roomY, room_id + "c")
				}
	        }
	    }
		
		//Set player starting point if this is the first room
		if(previous_room = -1)
		{
			//Marks the center of the room as the starting point
			ds_grid_set(layout_grid, currentX + floor(rWidth/2), currentY + floor(rHeight/2), "s");
		}

	    // Update the previous room
	    previous_room = [currentX, currentY, rWidth, rHeight];
		
	    currentY += rHeight + irandom_range(2, 5); // Move up by the height of our current room & random spacing
	}
	
	Remove_Useless_Tiles(layout_grid);

	// Show the grid in the console
	for (var i = grid_height; i >= 0; i--) {
	    var row = "";
	    for (var j = 0; j < grid_width + 1; j++) {
	        row += " ";
	        row += string(ds_grid_get(layout_grid, j, i));
			if (string_length(ds_grid_get(layout_grid, j, i)) == 1) {
				row += "  ";
			}
	    }
	    show_debug_message(row);
	}
	
	return layout_grid;
}

	// Function to connect two rooms with a winding path
function Connect_Rooms(layout_grid, room1_x, room1_y, room1_width, room1_height, room2_x, room2_y, room2_width, room2_height) {
	var start_x = room1_x + irandom(room1_width - 1);
	var start_y = room1_y-1;
	var end_x = room2_x + irandom(room2_width - 1);
	var end_y = room2_y;
	
	while (start_x != end_x || start_y != end_y) {
		var path_randomizer = random_range(0,1);
		if (start_x == end_x) {
			path_randomizer = 0;
		}
		else if (start_y == end_y) {
			path_randomizer = 1;
		}
		if (path_randomizer <= 0.6) {
			if (ds_grid_get(layout_grid, start_x, start_y) == "0") {
				ds_grid_set(layout_grid, start_x, start_y, "1");
			}
			start_y += 1;
		}
		else {
			if (ds_grid_get(layout_grid, start_x, start_y) == "0") {
				ds_grid_set(layout_grid, start_x, start_y, "1");
			}
			start_x += (end_x - start_x) / abs(end_x - start_x);
		}
	}
}

function Remove_Useless_Tiles(layout_grid)
{
	var grid_height = ds_grid_height(layout_grid);
	var grid_width = ds_grid_width(layout_grid);
	for (var i = 0; i < grid_width; i++) {
	    for (var j = 0; j < grid_height; j++) {
			if(ds_grid_get(layout_grid, i, j) == "0")
			{
				var up_grid = "0";
				var down_grid = "0";
				var left_grid = "0";
				var right_grid = "0";
				var up_left_grid = "0";
				var up_right_grid = "0";
				var down_left_grid = "0";
				var down_right_grid = "0";
				
				if(j < grid_height - 1)
				{
				up_grid = ds_grid_get(layout_grid, i, j + 1);
				if(i > 0)
				up_left_grid = ds_grid_get(layout_grid, i - 1, j + 1);
				if(i < grid_width - 1)
				up_right_grid = ds_grid_get(layout_grid, i + 1, j + 1);
				}
				
				if(j > 0)
				{					
				down_grid = ds_grid_get(layout_grid, i, j - 1);
				if(i > 0)
				down_left_grid = ds_grid_get(layout_grid, i - 1, j - 1);
				if(i < grid_width - 1)
				down_right_grid = ds_grid_get(layout_grid, i + 1, j - 1);	
				}
				
				if(i > 0)
				left_grid = ds_grid_get(layout_grid, i - 1, j);
				
				if(i < grid_width - 1)
				right_grid = ds_grid_get(layout_grid, i + 1, j);
	
			
				//Big check to see if any of the grids next to this (including diagonals) are non empty and non wall
				if((up_grid != "0" && up_grid != "w") ||
				(down_grid != "0" && down_grid != "w") ||
				(left_grid != "0" && left_grid != "w") ||
				(right_grid != "0" && right_grid != "w") ||
				(up_left_grid != "0" && up_left_grid != "w") ||
				(up_right_grid != "0" && up_right_grid != "w") ||
				(down_left_grid != "0" && down_left_grid != "w") ||
				(down_right_grid != "0" && down_right_grid != "w")){
					ds_grid_set(layout_grid, i, j, "w")
				}
			}
	    }
	}
}