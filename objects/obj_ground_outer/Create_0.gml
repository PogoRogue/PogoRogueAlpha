/// @description Create tilemap and collision walls

//create 16x16 ground objects to check for collisions and draw tiles 
for(i = 0; i < image_xscale; i++) {
	for(j = 0; j < image_yscale; j++) {
		if(i == 0 || i == (image_xscale - 1.0) || j == 0 || j == (image_yscale - 1.0)) {
			//commented out until we fix lag
			//instance_create_depth(x+(i*16),y+(j*16),depth-1,obj_ground_tiles_outer);
		}
	}
}
created_walls = false;