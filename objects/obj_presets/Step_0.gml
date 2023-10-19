/// @description Change presets
if keyboard_check_pressed(ord("1")) {
	obj_player.vsp_basicjump = -6
	obj_player.grv = 0.18
	obj_slider_bounceheight.custom_value = -obj_player.vsp_basicjump
	obj_slider_grav.custom_value = obj_player.grv
	obj_slider_bounceheight.value_ = (obj_slider_bounceheight.custom_value-obj_slider_bounceheight.custom_min_value)/(obj_slider_bounceheight.custom_max_value-obj_slider_bounceheight.custom_min_value)
	obj_slider_grav.value_ = (obj_slider_grav.custom_value-obj_slider_grav.custom_min_value)/(obj_slider_grav.custom_max_value-obj_slider_grav.custom_min_value)
	obj_player.use_mouse = true
	obj_slider_switch_controls.custom_value = obj_player.use_mouse
	with obj_slider_switch_controls {
		event_user(0)
	}
	global.use_mouse_for_slider = false
	preset_num = 1
	global.slider_index = 0
}
if keyboard_check_pressed(ord("2")) {
	obj_player.vsp_basicjump = -7.2
	obj_player.grv = 0.22
	obj_slider_bounceheight.custom_value = -obj_player.vsp_basicjump
	obj_slider_grav.custom_value = obj_player.grv
	obj_slider_bounceheight.value_ = (obj_slider_bounceheight.custom_value-obj_slider_bounceheight.custom_min_value)/(obj_slider_bounceheight.custom_max_value-obj_slider_bounceheight.custom_min_value)
	obj_slider_grav.value_ = (obj_slider_grav.custom_value-obj_slider_grav.custom_min_value)/(obj_slider_grav.custom_max_value-obj_slider_grav.custom_min_value)
	obj_player.use_mouse = true
	obj_slider_switch_controls.custom_value = obj_player.use_mouse
	with obj_slider_switch_controls {
		event_user(0)
	}
	global.use_mouse_for_slider = false
	preset_num = 2
	global.slider_index = 0
}
if keyboard_check_pressed(ord("3")) {
	obj_player.vsp_basicjump = -6.5
	obj_player.grv = 0.2
	obj_slider_bounceheight.custom_value = -obj_player.vsp_basicjump
	obj_slider_grav.custom_value = obj_player.grv
	obj_slider_bounceheight.value_ = (obj_slider_bounceheight.custom_value-obj_slider_bounceheight.custom_min_value)/(obj_slider_bounceheight.custom_max_value-obj_slider_bounceheight.custom_min_value)
	obj_slider_grav.value_ = (obj_slider_grav.custom_value-obj_slider_grav.custom_min_value)/(obj_slider_grav.custom_max_value-obj_slider_grav.custom_min_value)
	obj_player.use_mouse = true
	obj_slider_switch_controls.custom_value = obj_player.use_mouse
	with obj_slider_switch_controls {
		event_user(0)
	}
	global.use_mouse_for_slider = false
	preset_num = 3
	global.slider_index = 0
}
if keyboard_check_pressed(ord("4")) {
	obj_player.vsp_basicjump = -7.5
	obj_player.grv = 0.24
	obj_slider_bounceheight.custom_value = -obj_player.vsp_basicjump
	obj_slider_grav.custom_value = obj_player.grv
	obj_slider_bounceheight.value_ = (obj_slider_bounceheight.custom_value-obj_slider_bounceheight.custom_min_value)/(obj_slider_bounceheight.custom_max_value-obj_slider_bounceheight.custom_min_value)
	obj_slider_grav.value_ = (obj_slider_grav.custom_value-obj_slider_grav.custom_min_value)/(obj_slider_grav.custom_max_value-obj_slider_grav.custom_min_value)
	obj_player.use_mouse = false
	obj_slider_switch_controls.custom_value = obj_player.use_mouse
	with obj_slider_switch_controls {
		event_user(0)
	}
	global.use_mouse_for_slider = true
	preset_num = 4
}
if keyboard_check_pressed(ord("5")) {
	obj_player.vsp_basicjump = -5.8
	obj_player.grv = 0.17
	obj_slider_bounceheight.custom_value = -obj_player.vsp_basicjump
	obj_slider_grav.custom_value = obj_player.grv
	obj_slider_bounceheight.value_ = (obj_slider_bounceheight.custom_value-obj_slider_bounceheight.custom_min_value)/(obj_slider_bounceheight.custom_max_value-obj_slider_bounceheight.custom_min_value)
	obj_slider_grav.value_ = (obj_slider_grav.custom_value-obj_slider_grav.custom_min_value)/(obj_slider_grav.custom_max_value-obj_slider_grav.custom_min_value)
	obj_player.use_mouse = false
	obj_slider_switch_controls.custom_value = obj_player.use_mouse
	with obj_slider_switch_controls {
		event_user(0)
	}
	global.use_mouse_for_slider = true
	preset_num = 5
}
if keyboard_check_pressed(ord("6")) {
	obj_player.vsp_basicjump = -6.4
	obj_player.grv = 0.21
	obj_slider_bounceheight.custom_value = -obj_player.vsp_basicjump
	obj_slider_grav.custom_value = obj_player.grv
	obj_slider_bounceheight.value_ = (obj_slider_bounceheight.custom_value-obj_slider_bounceheight.custom_min_value)/(obj_slider_bounceheight.custom_max_value-obj_slider_bounceheight.custom_min_value)
	obj_slider_grav.value_ = (obj_slider_grav.custom_value-obj_slider_grav.custom_min_value)/(obj_slider_grav.custom_max_value-obj_slider_grav.custom_min_value)
	obj_player.use_mouse = false
	obj_slider_switch_controls.custom_value = obj_player.use_mouse
	with obj_slider_switch_controls {
		event_user(0)
	}
	global.use_mouse_for_slider = true
	preset_num = 6
}