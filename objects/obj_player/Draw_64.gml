/// @description draw weapon text and ammo GUI and coins

//weapon text
display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
draw_set_font(fnt_combo2);
draw_set_halign(fa_right);
scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])-16,40,gun.name,make_color_rgb(242,240,229));

//draw ammo
var ammo = gun.ammo[bullet_index];
for(i = 0; i < gun.bullets_per_bounce; i++) {
	draw_sprite(ammo.gui_sprite,i+gun.current_bullets<gun.bullets_per_bounce,(camera_get_view_width(view_camera[0])-16)-(i*(sprite_get_width(ammo.gui_sprite)+4)),16);
}

//coins
coin_x = 24;
coin_y = 56;
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_sprite(spr_coingui,0,coin_x,coin_y);
scr_Draw_Text_Outlined(coin_x-2,coin_y+1,"x"+string(global.num_of_coins),c_white);