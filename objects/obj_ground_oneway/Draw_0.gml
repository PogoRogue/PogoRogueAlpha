/// @description Draw Tiles
if !(instance_exists(obj_proc_gen_controller) || instance_exists(obj_sprite_test_room_generator)) {
	for(i=0;i<image_xscale;i++) {
		draw_tile(tileset,tile_frame[i],0,xx[i],y);
	}
}