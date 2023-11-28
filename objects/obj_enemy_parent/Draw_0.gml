/// @description Draw self

if(red_frames > 0) {
	shader_set(sh_tint_red);
}

if(!is_dead) {
	image_alpha = abs(cos(current_iframes / 5)) + 0.2;
}

draw_self();
shader_reset();

if(draw_hp) 
{
	hp_percent = (hp / hp_max) * 100;
	draw_healthbar(x - 32, y - sprite_height, x + 32, y - sprite_height + 1, hp_percent, #212123, #B45252, #B45252, 0, true, true);
}