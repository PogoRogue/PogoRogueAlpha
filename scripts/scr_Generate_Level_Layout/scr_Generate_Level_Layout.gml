function scr_Generate_Level_Layout(room_number)
{

	// Create a grid to hold our layout
	var grid_height = 10;
	var grid_width = 15;

	var layoutGrid = ds_grid_create(grid_width + 1, grid_height + 1); // +1 since we start at 0

	// Print what seed we're currently on
	var seed = randomize();
	show_debug_message("Random seed: " + string(seed));

	var currentY = 1; //Start above the bottom of the grid so that we can put walls below it
	var currentX = 0;
	// Our prebuilt rooms and their dimensions
	// Room format: [width, height, room_id]
	var prebuilt_rooms = ds_list_create();
	ds_list_add(prebuilt_rooms, [3, 3, "b1"]);
	//ds_list_add(prebuilt_rooms, [4, 3, "b2"]);
	//ds_list_add(prebuilt_rooms, [3, 4, "b3"]);
	//ds_list_add(prebuilt_rooms, [4, 4, "b4"]);

	ds_list_shuffle(prebuilt_rooms); // Shuffle our rooms, THIS IS SEEDED!

	var previousRoom = -1;

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
				ds_grid_resize(layoutGrid, grid_width+1, (grid_height*2)+1);
				grid_height *= 2;
			}
		// Connect the rooms with winding paths
	    if (previousRoom != -1) {
	        connectRooms(layoutGrid, previousRoom[0], previousRoom[1]+rHeight, previousRoom[2], previousRoom[3], currentX, currentY, rWidth, rHeight);
	    }

	    // Place the current room
	    for (var roomX = currentX; roomX < currentX + rWidth; roomX++) {
	        for (var roomY = currentY; roomY < currentY + rHeight; roomY++) {
	            ds_grid_set(layoutGrid, roomX, roomY, room_id);
				//Mark corners of rooms
				if(roomX == currentX && roomY == currentY + rHeight - 1)
				{
					ds_grid_set(layoutGrid, roomX, roomY, room_id + "c")
				}
	        }
	    }
		
		//Set player starting point if this is the first room
		if(previousRoom = -1)
		{
			//Marks the center of the room as the starting point
			ds_grid_set(layoutGrid, currentX + floor(rWidth/2), currentY + floor(rHeight/2), "s");
		}

	    // Update the previous room
	    previousRoom = [currentX, currentY, rWidth, rHeight];
		
	    currentY += rHeight + irandom_range(2, 5) // Move up by the height of our current room & random spacing
	}


	// Show the grid in the console
	for (var i = grid_height; i >= 0; i--) {
	    var row = "";
	    for (var j = 0; j < grid_width + 1; j++) {
	        row += " ";
	        row += string(ds_grid_get(layoutGrid, j, i));
			if (string_length(ds_grid_get(layoutGrid, j, i)) == 1) {
				row += "  ";
			}
	    }
	    show_debug_message(row);
	}
	
	return layoutGrid;
}

	// Function to connect two rooms with a winding path
function connectRooms(layoutGrid, room1X, room1Y, room1Width, room1Height, room2X, room2Y, room2Width, room2Height) {
	var startX = room1X + irandom(room1Width - 1);
	var startY = room1Y-1;
	var endX = room2X + irandom(room2Width - 1);
	var endY = room2Y;
	
	while (startX != endX || startY != endY) {
		var pathRandomizer = random_range(0,1);
		if (startX == endX) {
			pathRandomizer = 0;
		}
		else if (startY == endY) {
			pathRandomizer = 1;
		}
		if (pathRandomizer <= 0.6) {
			if (ds_grid_get(layoutGrid, startX, startY) == "0") {
				ds_grid_set(layoutGrid, startX, startY, "1");
			}
			startY += 1;
		}
		else {
			if (ds_grid_get(layoutGrid, startX, startY) == "0") {
				ds_grid_set(layoutGrid, startX, startY, "1");
			}
			startX += (endX - startX) / abs(endX - startX);
		}
	}
}