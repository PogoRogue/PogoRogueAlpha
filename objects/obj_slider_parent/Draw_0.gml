/// @description Draw the slider
draw_self()
if (global.slider_index = slider_index) {
	draw_sprite(spr_slider_bar_outline,0,x,y)
}
draw_sprite_part(sprite_index,1,0,0,sprite_width*value_,sprite_height,x,y-sprite_get_yoffset(sprite_index))
draw_sprite(spr_slider_button,0,x+sprite_width*value_,y)
if (draw_outline) or (selected) {
	draw_sprite(spr_slider_button_outline,0,x+sprite_width*value_,y)
}

//strings
draw_set_font(fnt_combo)
draw_set_valign(fa_center)
draw_set_halign(fa_right)
scr_Draw_Text_Outlined(x-6,y,string(custom_min_value))
draw_set_halign(fa_left)
scr_Draw_Text_Outlined(x+sprite_width+6,y,string(custom_max_value))
draw_set_halign(fa_center)
scr_Draw_Text_Outlined(x+sprite_width/2,y-10,str)
scr_Draw_Text_Outlined(x+sprite_width*value_,y+10,string(abs(custom_value)))