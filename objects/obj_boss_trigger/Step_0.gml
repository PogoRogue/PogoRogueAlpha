/// @description 

if(draw_cutin) {
	alpha += 0.01;
} else {
	alpha -= 0.01;
}

alpha = clamp(alpha, 0.0, 1.0);

