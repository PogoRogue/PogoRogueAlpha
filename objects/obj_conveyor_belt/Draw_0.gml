/// @description Draw Tiles
for(i=0;i<abs(image_xscale);i++) {
	draw_tile(tileset,tile_frame[i],0,xx[i],y);
	
	//draw arrows
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_combo);
	if sign(image_xscale) > 0 {
		scr_Draw_Text_Outlined(xx[i]+(8*sign(image_xscale)),y-8,"->",c_white);
	}else {
		scr_Draw_Text_Outlined(xx[i]+8,y-8,"<-",c_white);
	}
}