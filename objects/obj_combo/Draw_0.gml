draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt_combo2);

if global.combo > 0 {
	with obj_player {
		var distance = 48;
	
		draw_sprite_ext(spr_combometer,0,x + lengthdir_x(distance,angle+90),y + lengthdir_y(distance,angle+90),1,1,angle,c_white,1);
		var _x = -sprite_get_xoffset(spr_combometer);
		var _y = -sprite_get_yoffset(spr_combometer);
		var _c = dcos(angle);
		var _s = dsin(angle);
		draw_sprite_general(spr_combometer,1,0,0,global.combo_length,4,x  + lengthdir_x(distance,angle+90)+_c*_x+_s*_y,y + lengthdir_y(distance,angle+90)-_s*_x+_c*_y,1,1,angle,c_white,c_white,c_white,c_white,1);

		//text
		var white = make_color_rgb(242,240,229);
		draw_set_color(white)
		draw_text_transformed(x + lengthdir_x(distance+8,angle+90),y + lengthdir_y(distance+8,angle+90),"x" + string(global.combo),1,1,angle)
	}
}

draw_set_color(c_white);