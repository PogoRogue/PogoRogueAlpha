/// @description Reset variables

//create pause object
if !instance_exists(obj_pause) {
	instance_create_depth(0,0,depth,obj_pause);	
}
if !instance_exists(obj_pausemenu) {
	instance_create_depth(0,0,depth,obj_pausemenu);	
}

audio_stop_all();