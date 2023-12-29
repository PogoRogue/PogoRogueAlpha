if usable = true {
	key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up) || gamepad_axis_value(0,gp_axislv) < -0.5;
	key_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down) || gamepad_axis_value(0,gp_axislv) > 0.5;
	key_select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0,gp_face1);
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