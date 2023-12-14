/// @description Draw boss cutin

draw_set_alpha(alpha);

var old_w = display_get_gui_width();
var old_h = display_get_gui_height();

display_set_gui_size(1944, 1214);
draw_sprite(spr_boss_cutin, 0, 0, 0);

display_set_gui_size(old_w, old_h);

draw_set_alpha(1.0);

