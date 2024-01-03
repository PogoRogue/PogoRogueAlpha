function scr_Gamepad_Check_Input() {
    for (var i = gp_face1; i < gp_axisrv; i++) {
	    if (gamepad_button_check(0, i)) {
			return i;
		}
	}
	if (gamepad_axis_value(0,gp_axislh) > 0.5 or gamepad_axis_value(0,gp_axislh) < -0.5 
	or gamepad_axis_value(0,gp_axislv) > 0.65 or gamepad_axis_value(0,gp_axislv) < -0.65) {
		return 1;
	}
	return false;
}