key_left = global.key_left_menu;
key_right = global.key_right_menu;
key_select = global.key_select;
key_back = global.key_back;

if key_left and selected = false {
	if select > 1 {
		select -= 1;
	}
	selected = true;
}else if key_right and selected = false {
	if select < num_of_options {
		select += 1;
	}
	selected = true;
}else if !key_left and !key_right {
	selected = false;
}

if key_select {
	if select = 1 {
		alarm[0] = 1;
	}else if select = 2 {
		game_end();
	}
}

if key_back {
	alarm[0] = 1;	
}

image_index = select-1;