/// @description Draw strings by column

draw_set_halign(fa_left);
draw_set_font(fnt_combo)

// Draw left column
scr_Draw_Text_Outlined(x - 60, y, controls_left, c_white);

// Draw center column
scr_Draw_Text_Outlined(x, y, controls_middle, c_white);

// Draw right column
scr_Draw_Text_Outlined(x + 20, y, controls_right, c_white);
 
