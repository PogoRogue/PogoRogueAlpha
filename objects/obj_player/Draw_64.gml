/// @description draw weapon text and ammo GUI and coins

//weapon text
display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
draw_set_font(fnt_combo2);
draw_set_halign(fa_right);
scr_Draw_Text_Outlined(camera_get_view_width(view_camera[0])-16,40,gun.name,make_color_rgb(242,240,229));

//draw ammo
var ammo = gun.ammo[bullet_index];
for(i = 0; i < gun.bullets_per_bounce; i++) {
	if (gun_array[current_gun] != paintball_gun) and (gun_array[current_gun] != laser_gun) {
		draw_sprite(ammo.gui_sprite,i+gun.current_bullets<gun.bullets_per_bounce,(camera_get_view_width(view_camera[0])-16)-(i*(sprite_get_width(ammo.gui_sprite)+4)),16); 
	}else if (gun_array[current_gun] = paintball_gun) {
		draw_sprite(ammo.gui_sprite,((i+gun.current_bullets<gun.bullets_per_bounce)*10)+((i+gun.current_bullets>=gun.bullets_per_bounce)*i),(camera_get_view_width(view_camera[0])-16)-(i*(sprite_get_width(ammo.gui_sprite)+4)),16); 
	}
}
//laser
if (gun_array[current_gun] = laser_gun) {
	value_ = gun.current_bullets / gun.bullets_per_bounce;
	draw_sprite(ammo.gui_sprite,0,(camera_get_view_width(view_camera[0])-16),16);
	draw_sprite_part(ammo.gui_sprite,1,0,0,sprite_get_width(ammo.gui_sprite)*value_,sprite_height,(camera_get_view_width(view_camera[0])-16)-sprite_get_width(ammo.gui_sprite),16-(sprite_get_height(ammo.gui_sprite)/2));
}

//coins
coin_x = 24;
coin_y = 56;
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_sprite(spr_coingui,0,coin_x,coin_y);
scr_Draw_Text_Outlined(coin_x-2,coin_y+1,"x"+string(global.num_of_coins),c_white);

//PICKUPS
draw_set_font(fnt_combo);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

//cooldowns
if !(pickups_array[0].on_cooldown) {
	draw_sprite(pickups_array[0].gui_sprite,0,16,72);
}else {
	draw_sprite_ext(spr_pickup_empty,0,16,72,1,1,0,c_white,0.5);
	draw_sprite_part(pickups_array[0].gui_sprite,1,0,0,sprite_get_width(spr_pickup_empty)*(1-(pickups_array[0].cooldown_time/pickups_array[0].max_cooldown_time)),sprite_get_height(spr_pickup_empty),16,72);
	
	if pickups_array[0] != pickup_nothing {
		//draw seconds left
		scr_Draw_Text_Outlined(32,104,ceil(pickups_array[0].cooldown_time/60),c_white);
	}
}

if !(pickups_array[1].on_cooldown) {
	draw_sprite(pickups_array[1].gui_sprite,0,52,72);
}else {
	draw_sprite_ext(spr_pickup_empty,0,52,72,1,1,0,c_white,0.5);
	draw_sprite_part(pickups_array[1].gui_sprite,1,0,0,sprite_get_width(spr_pickup_empty)*(1-(pickups_array[1].cooldown_time/pickups_array[1].max_cooldown_time)),sprite_get_height(spr_pickup_empty),52,72);
	
	if pickups_array[1] != pickup_nothing {
		//draw seconds left
		scr_Draw_Text_Outlined(68,104,ceil(pickups_array[1].cooldown_time/60),c_white); 
	}
}

//show buttons
if (gamepad_is_connected(0)) {
	//button 1
	if !(pickups_array[0].on_cooldown) and pickups_array[0] != pickup_nothing {
		draw_sprite(spr_controller_button_bottom,0,32,104);
	}
	//button 2
	if !(pickups_array[1].on_cooldown) and pickups_array[1] != pickup_nothing {
		draw_sprite(spr_controller_button_right,0,68,104);
	}
}