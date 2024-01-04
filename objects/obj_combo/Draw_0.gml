draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt_combo2);

var white = make_color_rgb(255,255,255);
var combometer_sprite = spr_combometer;

if other.low_combo_meter = true {
	combometer_sprite = spr_combometer_red;
}

if global.combo > 0 {
	with obj_player {
		var distance = 52;
		if pickups_array[0] = pickup_hatgun or pickups_array[1] = pickup_hatgun { 
			distance += 18;
		}
		draw_sprite_ext(combometer_sprite,0,x + lengthdir_x(distance,angle+90),y + lengthdir_y(distance,angle+90),1,1,angle,white,1);
		var _x = -sprite_get_xoffset(combometer_sprite);
		var _y = -sprite_get_yoffset(combometer_sprite);
		var _c = dcos(angle);
		var _s = dsin(angle);
		draw_sprite_general(combometer_sprite,1,0,0,global.combo_length,4,x  + lengthdir_x(distance,angle+90)+_c*_x+_s*_y,y + lengthdir_y(distance,angle+90)-_s*_x+_c*_y,1,1,angle,c_white,c_white,c_white,c_white,1);

		//text
		white = make_color_rgb(242,240,229);
		if other.low_combo_meter = true {
			white = make_color_rgb(180,82,82); //red
		}
		draw_set_color(white)
		draw_text_transformed(x + lengthdir_x(distance+8,angle+90),y + lengthdir_y(distance+8,angle+90),"x" + string(global.combo) + " Combo",1,1,angle)
	}
}

draw_set_color(c_white);