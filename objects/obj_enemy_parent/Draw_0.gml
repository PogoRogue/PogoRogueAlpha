/// @description Draw self

if(red_frames > 0) {
	shader_set(sh_tint_red);
}

if(!is_dead) {
	image_alpha = abs(cos(current_iframes / 5)) + 0.2;
}

draw_self();
shader_reset();