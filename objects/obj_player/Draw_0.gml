/// @description draw self
if(current_i_frames >= num_i_frames - 10 || dead) {
	shader_set(sh_tint_red);
}

image_alpha = abs(cos(current_i_frames / 5)) + 0.2;

draw_self();
shader_reset();