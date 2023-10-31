/// @description check collisions for tiles
for(i = 0; i < image_xscale; i++) {
	for(j = 0; j < image_yscale; j++) {
		scr_Draw_Tiles(x+(i*16),y+(j*16),16,tileset,obj_ground_parent);
		xx[i] = x+(i*16);
		yy[j] = y+(j*16);
	}
}