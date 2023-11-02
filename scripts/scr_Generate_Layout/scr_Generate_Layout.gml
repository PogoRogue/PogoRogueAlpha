// Create a grid to hold our layout
gridSize = 12;
layoutGrid = ds_grid_create(gridSize+1, gridSize+1); // +1 since we start at 0
downEnable = true;
randomize();


// What coordinate should our first room be at?
startCoord = irandom(gridSize);
var currentY = gridSize;
var currentX = startCoord;
	
ds_grid_set(layoutGrid, currentX, currentY, "s");
while(currentY != 0) {
	var nextCoord = chooseNext(currentX, currentY);	
	if (nextCoord = 0) { // up
		currentY--;
		ds_grid_set(layoutGrid, currentX, currentY, 1);
	}
	if (nextCoord = 1) { // left
		currentX--;
		ds_grid_set(layoutGrid, currentX, currentY, 1);
	}
	if (nextCoord = 2) { // right
		currentX++;
		ds_grid_set(layoutGrid, currentX, currentY, 1);
	}
	if (nextCoord = 3) { // down
		currentY++;
		ds_grid_set(layoutGrid, currentX, currentY, 1);
	}
}
ds_grid_set(layoutGrid, currentX, currentY, "f");
//change_grid_numbers();

function chooseNext(currentX, currentY) {
	// look at points around current, pick valid points
	current_grid = ds_grid_get(layoutGrid, currentX, currentY);
	var up, left, right, down = false;
	up = isValidGrid(currentX, currentY-1);
	left = isValidGrid(currentX-1, currentY);
	right = isValidGrid(currentX+1, currentY);
	down = isValidGrid(currentX, currentY+1);
	
	list = ds_list_create();
	if (up) {
		ds_list_add(list, 0);
	}
	if (left) {
		ds_list_add(list, 1);
	}
	if (right) {
		ds_list_add(list, 2);
	}
	if (down && downEnable) {
		ds_list_add(list, 3);
	}
	rand = irandom(ds_list_size(list)-1);
	return ds_list_find_value(list, rand);
}

function isValidGrid(curX, curY) {
	if (curX > gridSize || curX < 0 || curY > gridSize || curY < 0) {
		return false;	
	}
	current_grid = ds_grid_get(layoutGrid, curX, curY);
	if (current_grid != 0) {
		return false;
	}
	
	var adjacents = 0;
	if (curX+1 <= gridSize && curX+1 >= 0) {
		if (ds_grid_get(layoutGrid, curX+1, curY) != 0) {
			adjacents++;
		}
	}
	if (curX-1 <= gridSize && curX-1 >= 0) {
		if (ds_grid_get(layoutGrid, curX-1, curY) != 0) {
			adjacents++;
		}
	}
	if (curY+1 <= gridSize && curY+1 >= 0) {
		if (ds_grid_get(layoutGrid, curX, curY+1) != 0) {
			adjacents++;
		}
	}
	if (curY-1 <= gridSize && curY-1 >= 0) {
		if (ds_grid_get(layoutGrid, curX, curY-1) != 0) {
			adjacents++;
		}
	}
	if (adjacents > 1) {
		return false;
	}
	
	return true; // Valid room
}

/* Go through our grid and decide what numbers should be placed
 1 for up+down
 2 for left+right
 3 for up+right
 4 for up+left
 5 for down+right
 6 for down+left
 7 for up+right+left
 8 for up+down+right
 9 for up+down+left 
*/
/*
function change_grid_numbers() {
	currentY = gridSize;
	currentX = startCoord;
	var number = 1;
	up = holds_room(currentX, currentY-1);
	left = holds_room(currentX-1, currentY);
	right = holds_room(currentX+1, currentY);
	down = holds_room(currentX, currentY+1);
	
	switch (number) {
		case (up and down):
			number = 1;
		break;
	}
}

function holds_room(curX, curY) {
	if (curX > gridSize || curX < 0 || curY > gridSize || curY < 0) {
		return false;	
	}
	current_grid = ds_grid_get(layoutGrid, curX, curY);
	if (current_grid != 0) {
		return true;
	}
	
	var adjacents = 0;
	if (curX+1 <= gridSize && curX+1 >= 0) {
		if (ds_grid_get(layoutGrid, curX+1, curY) != 0) {
			adjacents++;
		}
	}
	if (curX-1 <= gridSize && curX-1 >= 0) {
		if (ds_grid_get(layoutGrid, curX-1, curY) != 0) {
			adjacents++;
		}
	}
	if (curY+1 <= gridSize && curY+1 >= 0) {
		if (ds_grid_get(layoutGrid, curX, curY+1) != 0) {
			adjacents++;
		}
	}
	if (curY-1 <= gridSize && curY-1 >= 0) {
		if (ds_grid_get(layoutGrid, curX, curY-1) != 0) {
			adjacents++;
		}
	}
	if (adjacents > 1) {
		return false;
	}
	
	return true; // Room exists
}
*/

// Show the grid in the console
for (var i = 0; i < gridSize+1; i++) {
	row = "";
	for (var j = 0; j < gridSize+1; j++) {
		row += " ";
		row += string(ds_grid_get(layoutGrid, j, i));
	}
	show_debug_message(row);	
}