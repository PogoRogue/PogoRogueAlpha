/// @description draw self
if(current_i_frames >= num_i_frames - 10 || dead) {
	shader_set(sh_tint_red);
}

image_alpha = abs(cos(current_i_frames / 5)) + 0.2;

draw_self();
shader_reset();

//draw charge bar
if (state = state_charging) or (state = state_bouncing and key_charge_jump) {
	draw_sprite_general(spr_chargebar,0,0,0,sprite_get_width(spr_chargebar),sprite_get_height(spr_chargebar),x+(lengthdir_x(16,image_angle)*image_xscale),y+(lengthdir_y(16,image_angle)*image_xscale),image_xscale,-1,image_angle,c_white,c_white,c_white,c_white,1);
	draw_sprite_general(spr_chargebar_color,0,0,0,sprite_get_width(spr_chargebar_color),sprite_get_height(spr_chargebar_color)*(charge/charge_max),x+(lengthdir_x(16,image_angle)*image_xscale),y+(lengthdir_y(16,image_angle)*image_xscale),image_xscale,-1,image_angle,c_white,c_white,c_white,c_white,1);
	draw_sprite_ext(spr_player_zekai_charging,0,x,y,image_xscale,image_yscale,image_angle,c_white,(charge/charge_max)*0.5 + 0.1);
}