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
		with obj_pause {
			paused_outside = true;
		}
	}else if select = 2 {
		usable = false;
		instance_create_depth(x,y,depth+1,obj_items);
	}else if select = 3 {
		usable = false;
		instance_create_depth(x,y,depth+1,obj_popup_restart);
	}else if select = 4 {
		//implement later
	}else if select = 5 {
		usable = false;
		instance_create_depth(x,y,depth+1,obj_popup_exit);
	}
}

image_index = select-1;