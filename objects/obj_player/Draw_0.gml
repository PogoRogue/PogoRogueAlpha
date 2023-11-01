/// @description draw self
if(current_iframes >= num_iframes - 10 || dead) {
	shader_set(sh_tint_red);
}

image_alpha = abs(cos(current_iframes / 5)) + 0.2;

draw_self();
shader_reset();

//uncomment to show collision check location
//draw_sprite(spr_dot,0,x+lengthdir_x(speed,image_angle-90),y+lengthdir_y(vspeed,image_angle-90))

