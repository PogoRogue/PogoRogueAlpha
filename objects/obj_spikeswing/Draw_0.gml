draw_sprite_ext(spr_spikeball_handle_base,0,anchor_x,anchor_y,1,1,angle+90,c_white,1);
draw_sprite_ext(spr_spikeball_handle,0,anchor_x,anchor_y,1,1,angle+90,c_white,1);
for(i = 16; i < distance; i+=16) {
	draw_sprite_ext(spr_spikeball_handle,1,anchor_x+lengthdir_x(i,angle),anchor_y+lengthdir_y(i,angle),1,1,angle+90,c_white,1);
}
draw_self();