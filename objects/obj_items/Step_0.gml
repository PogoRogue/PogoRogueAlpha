key_left = keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left) || gamepad_axis_value(0,gp_axislh) < -0.5;
key_right = keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right) || gamepad_axis_value(0,gp_axislh) > 0.5;
key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up) || gamepad_axis_value(0,gp_axislv) < -0.5;
key_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down) || gamepad_axis_value(0,gp_axislv) > 0.5;
key_select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0,gp_face1);
key_back = keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_tab) || gamepad_button_check_pressed(0,gp_start) || gamepad_button_check_pressed(0,gp_face2);

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