/// @description Draw self

if(is_dead) {
	shader_set(sh_tint_red);
}

draw_self();
shader_reset();
