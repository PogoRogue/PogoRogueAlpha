/// @description check collisions for tiles

if sign(image_xscale) > 0 {
	for(i=0;i<image_xscale;i++) {
		if position_meeting(x+(i*16)-1,y,obj_conveyor_belt) and position_meeting(x+(i*16)+17,y,obj_conveyor_belt) {
			tile_frame[i] = 8;
			xx[i] = x+(i*16);
		}else if !position_meeting(x+(i*16)-1,y,obj_conveyor_belt) and position_meeting(x+(i*16)+17,y,obj_conveyor_belt) {
			tile_frame[i] = 7;
			xx[i] = x+(i*16);
		}else if position_meeting(x+(i*16)-1,y,obj_conveyor_belt) and !position_meeting(x+(i*16)+17,y,obj_conveyor_belt) {
			tile_frame[i] = 9;
			xx[i] = x+(i*16);
		}
	}
}else {
	for(i=0;i<abs(image_xscale);i++) {
		if position_meeting(x-(i*16)-17,y,obj_conveyor_belt) and position_meeting(x-(i*16)+1,y,obj_conveyor_belt) {
			tile_frame[i] = 8;
			xx[i] = x-(i*16)-16;
		}else if !position_meeting(x-(i*16)-17,y,obj_conveyor_belt) and position_meeting(x-(i*16)+1,y,obj_conveyor_belt) {
			tile_frame[i] = 7;
			xx[i] = x-(i*16)-16;
		}else if position_meeting(x-(i*16)-17,y,obj_conveyor_belt) and !position_meeting(x-(i*16)+1,y,obj_conveyor_belt) {
			tile_frame[i] = 9;
			xx[i] = x-(i*16)-16;
		}
	}
}