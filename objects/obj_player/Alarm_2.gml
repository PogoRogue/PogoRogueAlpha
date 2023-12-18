/// @description create text in proc gen room
//temporarily disabled 
/*
while(!place_meeting(x,y+32,obj_ground) and !place_meeting(x,y+32,obj_ground_oneway)) {
	y++;	
}
if room = room_proc_gen_test || room = room_sprite_level_test {
	instance_create_depth(x-64,y-64,depth+100,obj_room_title);
}