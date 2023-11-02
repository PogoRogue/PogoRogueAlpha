/// @description check collisions for tiles

for(i=0;i<image_xscale;i++) {
	if position_meeting(x+(i*16)-1,y,obj_ground_oneway) and position_meeting(x+(i*16)+17,y,obj_ground_oneway) {
		tile_frame[i] = 4;
		xx[i] = x+(i*16);
	}else if !position_meeting(x+(i*16)-1,y,obj_ground_oneway) and position_meeting(x+(i*16)+17,y,obj_ground_oneway) {
		tile_frame[i] = 3;
		xx[i] = x+(i*16);
	}else if position_meeting(x+(i*16)-1,y,obj_ground_oneway) and !position_meeting(x+(i*16)+17,y,obj_ground_oneway) {
		tile_frame[i] = 5;
		xx[i] = x+(i*16);
	}
}