/// @description Draw Tiles
if room != room_proc_gen_test {
	for(i=0;i<image_xscale;i++) {
		draw_tile(tileset,tile_frame[i],0,xx[i],y);
	}
}else {
	draw_self();	
}