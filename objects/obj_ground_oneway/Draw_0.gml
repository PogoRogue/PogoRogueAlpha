/// @description Draw Tiles
draw_self();
for(i=0;i<image_xscale;i++) {
	draw_tile(tileset,tile_frame[i],0,xx[i],y);
}