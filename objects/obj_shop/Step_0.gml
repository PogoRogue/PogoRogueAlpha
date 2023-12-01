key_left = keyboard_check(ord("A")) || keyboard_check(vk_left) || gamepad_axis_value(0,gp_axislh) < -0.5;
key_right = keyboard_check(ord("D")) || keyboard_check(vk_right) || gamepad_axis_value(0,gp_axislh) > 0.5;
key_up = keyboard_check(ord("W")) || keyboard_check(vk_up) || gamepad_axis_value(0,gp_axislv) < -0.5;
key_down = keyboard_check(ord("S")) || keyboard_check(vk_down) || gamepad_axis_value(0,gp_axislv) > 0.5;
key_select = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0,gp_face1);

if key_left and select % 2 = 0 {
	select -= 1;	
}else if key_right and select % 2 != 0 {
	select += 1;	
}

if selected_y = false {
	if key_up and select > 2 {
		select -= 2;
		selected_y = true;
	}else if key_down and select < 7 {
		select += 2;	
		selected_y = true;
	}
}else {
	if !key_up and !key_down {
		selected_y = false;
	}
}