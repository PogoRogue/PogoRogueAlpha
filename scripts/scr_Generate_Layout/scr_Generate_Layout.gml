// CHANGEABLE VARIABLES:
room_number = 8; // How many rooms to generate

// Create a grid to hold our layout
grid_height = 30;
grid_width = 20;

layoutGrid = ds_grid_create(grid_width + 1, grid_height + 1); // +1 since we start at 0

// Print what seed we're currently on
var seed = randomize();
show_debug_message("Random seed: " + string(seed));

var currentY = grid_height + 1;
var currentX = 0;
// Our prebuilt rooms and their dimensions
// Room format: [width, height, room_id]
var prebuilt_rooms = ds_list_create();
ds_list_add(prebuilt_rooms, [3, 3, "b1"]);
ds_list_add(prebuilt_rooms, [4, 3, "b2"]);
ds_list_add(prebuilt_rooms, [3, 4, "b3"]);
ds_list_add(prebuilt_rooms, [4, 4, "b4"]);

ds_list_shuffle(prebuilt_rooms); // Shuffle our rooms, THIS IS SEEDED!

// Function to connect two rooms with a winding path
connectRooms = function(room1X, room1Y, room1Width, room1Height, room2X, room2Y, room2Width, room2Height) {
    var startX = room1X + irandom(room1Width - 1);
    var startY = room1Y;
    var endX = room2X + irandom(room2Width - 1);
    var endY = room2Y + (room2Height - 1);
	
	while (startX != endX || startY != endY) {
		pathRandomizer = random_range(0,1);
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
			startY -= 1;
		}
		else {
			if (ds_grid_get(layoutGrid, startX, startY) == "0") {
				ds_grid_set(layoutGrid, startX, startY, "1");
			}
			startX += (endX - startX) / abs(endX - startX);
		}
	}
};

var previousRoom = -1;

for (var rCount = 0; rCount < room_number; rCount++) {
    var room_index = choose(0, 1, 2, 3); // Pick a random prebuilt_room
    var r = ds_list_find_value(prebuilt_rooms, room_index);
    var rWidth = r[0];
    var rHeight = r[1];
    var room_id = r[2];
    show_debug_message(room_id)
    //show_debug_message("before subtraction " + string(currentY));
    currentY -= rHeight;
    //show_debug_message("Y" + string(currentY));
    currentX = irandom(grid_width - rWidth); // Random X axis placement
    //show_debug_message("X:" + string(currentX));

    // Ensure rooms are in the grid bounds
    if (
        currentY >= 0 &&
        currentX >= 0 &&
        currentY + rHeight <= grid_height + 1 &&
        currentX + rWidth <= grid_width
    ) {
        // Connect the rooms with winding paths
        if (previousRoom != -1) {
            connectRooms(previousRoom[0], previousRoom[1], previousRoom[2], previousRoom[3], currentX, currentY, rWidth, rHeight);
        }

        // Place the current room
        for (var roomX = currentX; roomX < currentX + rWidth; roomX++) {
            for (var roomY = currentY; roomY < currentY + rHeight; roomY++) {
                ds_grid_set(layoutGrid, roomX, roomY, room_id);
            }
        }

        // Update the previous room
        previousRoom = [currentX, currentY, rWidth, rHeight];
    }
	else {
		ds_grid_resize(layoutGrid, grid_width, grid_height*2);
		grid_height *= 2;
    currentY -= irandom_range(1, 5) // Move up by the height of our current room & random spacing
}

// Show the grid in the console
for (var i = 0; i < grid_height + 1; i++) {
    row = "";
    for (var j = 0; j < grid_width + 1; j++) {
        row += " ";
        row += string(ds_grid_get(layoutGrid, j, i));
		if (string_length(ds_grid_get(layoutGrid, j, i)) == 1) {
			row += "  ";
		}
    }
    show_debug_message(row);
}
