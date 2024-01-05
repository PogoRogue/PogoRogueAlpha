restart_button = keyboard_check_pressed(ord("R")); //press R key to restart room (temporary)
screenshake_button = keyboard_check_pressed(vk_backspace); //press escape key to restart room (temporary)
mute_button = keyboard_check_pressed(ord("M")); //press M to mute audio (temporary)
itemmenu_button = global.key_item_menu; 

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

if (itemmenu_button) and obj_pause.pause = false {
	instance_create_depth(x,y,depth-1,obj_items);
}


if (screenshake_button) {
	global.allow_screenshake = not global.allow_screenshake;
}

//last room
if room != room_shop {
	global.last_room = room;	
}