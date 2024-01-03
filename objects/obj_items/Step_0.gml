key_left = global.key_left_menu;
key_right = global.key_right_menu;
key_up = global.key_up_menu;
key_down = global.key_down_menu;
key_select = global.key_select;
key_back = global.key_back || global.key_item_menu;

if select_y = 0 { //top row, change between item types
	select_x = 1;
	if key_left and select > 1 and selected_x = false {
		select -= 1;
		selected_x = true;
	}
	if key_right and select < select_max and selected_x = false {
		select += 1;
		selected_x = true;
	}
	//down
	if select = 1 and key_down and select_y < select_y_max and selected_y = false {
		select_y += 1;
		selected_y = true;
	}
}

//passives
if select = 1 and select_y > 0 {
	if key_left and select_x > 1 and selected_x = false {
		select_x -= 1;
		selected_x = true;
	}
	if key_right and select_x < select_x_max and selected_x = false {
		select_x += 1;
		selected_x = true;
	}
	if key_up and select_y > 0 and selected_y = false {
		select_y -= 1;
		selected_y = true;
	}
	if key_down and select_y < select_y_max and selected_y = false {
		select_y += 1;
		selected_y = true;
	}
}

if !key_left and !key_right {
	selected_x = false;
}

if !key_up and !key_down {
	selected_y = false;
}

if key_back {
	alarm[0] = 1;
}