restart_button = keyboard_check_pressed(ord("R")) || gamepad_button_check_pressed(0,gp_select); //press R key to restart room
screenshake_button = keyboard_check_pressed(vk_backspace); //press escape key to restart room
mute_button = keyboard_check_pressed(ord("M")); 

if (restart_button) {
	instance_deactivate_all(false);
	room_restart();
}

if (mute_button) {
	global.mute = not global.mute;
	var num = audio_get_listener_count();
	for( var i = 0; i < num; i++;)
	{
	    var info = audio_get_listener_info(i);
		if global.mute = true {
			audio_set_master_gain(info[? "index"], 0);
		}else {
			audio_set_master_gain(info[? "index"], 1);
		}
	    ds_map_destroy(info);
	}
}


if (screenshake_button) {
	global.allow_screenshake = not global.allow_screenshake;
}

//last room
if room != room_shop {
	global.last_room = room;	
}