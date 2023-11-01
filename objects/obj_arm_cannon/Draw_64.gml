/// @description draw weapon text and ammo GUI

//weapon text
display_set_gui_size(640,360);
draw_set_font(fnt_combo2);
scr_Draw_Text_Outlined(16,16,gun.name,c_white);

//draw ammo
var ammo = gun.ammo[bullet_index];
for(i = 0; i < gun.bullets_per_bounce; i++) {
	draw_sprite(ammo.gui_sprite,i+gun.current_bullets<gun.bullets_per_bounce,624-(i*(sprite_get_width(ammo.gui_sprite)+4)),16);
}