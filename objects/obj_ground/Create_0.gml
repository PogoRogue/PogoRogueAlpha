/// @description create tile object and create walls

//create 16x16 ground objects to check for collisions and draw tiles 
for(i = 0; i < image_xscale; i++) {
	for(j = 0; j < image_yscale; j++) {
		if room != room_gameplay_video {
			instance_create_depth(x+(i*16),y+(j*16),depth-1,obj_ground_tiles);
		}
	}
}

sprite_index = spr_groundInnerColor;
//create collision walls
scr_Create_Collision_Walls();