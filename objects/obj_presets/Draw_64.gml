/// @description Draw Text
display_set_gui_size(640,360);
draw_set_font(fnt_combo2);
draw_set_valign(fa_center);
draw_set_halign(fa_right);
scr_Draw_Text_Outlined(624,16,"Preset #" + string(preset_num),c_white);