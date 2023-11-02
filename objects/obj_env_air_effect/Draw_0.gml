/// @description draw self
draw_self();
//overlap same sprite to be more visible
draw_sprite_ext(sprite_index,image_index+4,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha);
draw_sprite_ext(sprite_index,image_index+8,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha);