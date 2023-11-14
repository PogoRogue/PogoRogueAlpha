display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fnt_combo2);

var rect_left = 8;
var rect_right = rect_left + 100;
var rect_top = 64;
var rect_bottom = 80;

//text
scr_Draw_Text_Outlined(rect_left+((rect_right-rect_left)/2),rect_bottom+8,"x" + string(global.combo) + " Combo",c_white);

//background line
draw_set_color(c_white);
draw_rectangle(rect_left,rect_top,rect_right,rect_bottom,false);

//black
draw_set_color(c_black);
draw_rectangle(rect_left+1,rect_top+1,rect_right-1,rect_bottom-1,false);

//actual bar
draw_set_color(c_white);
draw_rectangle(rect_left,rect_top+1,rect_left+(global.combo_length),rect_bottom-1,false);