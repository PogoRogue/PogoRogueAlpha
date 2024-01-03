if usable = true {
	key_up = global.key_up_menu;
	key_down = global.key_down_menu;
	key_select = global.key_select;
}else {
	key_up = 0;
	key_down = 0;
	key_select = 0;
}

if key_up and selected = false {
	if select > 1 {
		select -= 1;
	}
	selected = true;
}else if key_down and selected = false {
	if select < num_of_options {
		select += 1;
	}
	selected = true;
}else if !key_up and !key_down {
	selected = false;
}

if key_select {
	if select = 1 {
		room = room_gameplay_video;
	}else if select = 2 {
		room = room_proc_gen_test;
	}
}

image_index = select-1;