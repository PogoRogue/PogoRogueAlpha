/// @description Draw tiles
draw_self();

for(i = 0; i < image_xscale; i++) {
	for(j = 0; j < image_yscale; j++) {
		draw_tile(tileset,tile_frame[i][j],0,xx[i],yy[j]);
	}
}