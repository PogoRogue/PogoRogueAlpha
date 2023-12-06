/// @description Reset variables

//create pause object
if !instance_exists(obj_pause) {
	instance_create_depth(0,0,depth,obj_pause);	
}

global.num_of_coins = 100;
audio_stop_all();