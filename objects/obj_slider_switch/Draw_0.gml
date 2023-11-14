/// @description Draw
draw_sprite(sprite_index,custom_value,x,y);
if (global.slider_index = slider_index) or (draw_outline) {
	draw_sprite(spr_slider_switch_outline,0,x,y);
}

//strings
draw_set_font(fnt_combo);
draw_set_valign(fa_center);
draw_set_halign(fa_right);
if !custom_value {
	color = make_color_rgb(55,148,110);
}else {
	color = c_white;
}
scr_Draw_Text_Outlined(x-6,y,string(string_false),color);
draw_set_halign(fa_left);
if custom_value {
	color = make_color_rgb(55,148,110);
}else {
	color = c_white;
}
scr_Draw_Text_Outlined(x+sprite_width+6,y,string(string_true),color);
draw_set_halign(fa_center);
scr_Draw_Text_Outlined(x+sprite_width/2,y-10,str,c_white);