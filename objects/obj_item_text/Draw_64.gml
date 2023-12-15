draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_item_popup);
draw_set_alpha(alpha);
scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])/2,64,item_string,c_white);
draw_set_alpha(1);