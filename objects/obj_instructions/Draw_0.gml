/// @description Draw strings by column

draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_set_font(fnt_combo2);

// Draw left column
scr_Draw_Text_Outlined(x - 80, y, controls_left, make_color_rgb(242,240,229));

// Draw center column
scr_Draw_Text_Outlined(x, y, controls_middle, make_color_rgb(242,240,229));

// Draw right column
scr_Draw_Text_Outlined(x + 20, y, controls_right, make_color_rgb(242,240,229));
 
