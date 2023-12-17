/// @description draw self
if(current_iframes >= num_iframes - 10 || dead) {
	shader_set(sh_tint_red);
}

image_alpha = abs(cos(current_iframes / 5)) + 0.2;

//draw jetpack
if pickups_array[0] = pickup_jetpack or pickups_array[1] = pickup_jetpack {
	if sprite_index = player_sprite {
		draw_sprite_ext(spr_jetpack,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = falling_sprite {
		draw_sprite_ext(spr_jetpack,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = charging_sprite {
		draw_sprite_ext(spr_jetpack_charging,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}
}

draw_self();
shader_reset();

//draw charge bar
if (state = state_chargejump) {
	draw_sprite_general(spr_chargebar,0,0,0,sprite_get_width(spr_chargebar),sprite_get_height(spr_chargebar),x+(lengthdir_x(16,image_angle)*image_xscale),y+(lengthdir_y(16,image_angle)*image_xscale),image_xscale,-1,image_angle,c_white,c_white,c_white,c_white,1);
	draw_sprite_general(spr_chargebar_color,0,0,0,sprite_get_width(spr_chargebar_color),sprite_get_height(spr_chargebar_color)*(charge/charge_max),x+(lengthdir_x(16,image_angle)*image_xscale),y+(lengthdir_y(16,image_angle)*image_xscale),image_xscale,-1,image_angle,c_white,c_white,c_white,c_white,1);
	draw_sprite_ext(spr_player_zekai_charging_red,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,(charge/charge_max)*0.6 + 0.1);
}

//draw slam trail
var slam_alpha = 0;
if ground_pound_slam = true {
	if (slam_trail_distance  < slam_speed*2) {
		slam_trail_distance += 0.25 + ((slam_speed-slam_trail_distance)>9);
	}else { 
		slam_trail_distance += 0.1;
	}
	for(i = 5; i > 0; i -= 1) {
		slam_alpha += 0.2;
        draw_sprite_ext(sprite_index,image_index,x,y-(i*slam_trail_distance),image_xscale,image_yscale,image_angle,c_white,slam_alpha);
		//draw hat during slam
		if pickups_array[0] = pickup_hatgun or pickups_array[1] = pickup_hatgun {
			draw_sprite_ext(spr_player_zekai_hat_falling,image_index,x,y-(i*slam_trail_distance),image_xscale,image_yscale,image_angle,c_white,slam_alpha);
		}
		//draw jetpack during slam
		if pickups_array[0] = pickup_jetpack or pickups_array[1] = pickup_jetpack {
			draw_sprite_ext(spr_jetpack,0,x,y-(i*slam_trail_distance),image_xscale,image_yscale,image_angle,c_white,slam_alpha);
		}
    }
	draw_self();
}

//draw hat gun
if pickups_array[0] = pickup_hatgun or pickups_array[1] = pickup_hatgun {
	if sprite_index = player_sprite {
		draw_sprite_ext(spr_player_zekai_hat,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = falling_sprite {
		draw_sprite_ext(spr_player_zekai_hat_falling,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}else if sprite_index = charging_sprite {
		draw_sprite_ext(spr_player_zekai_hat_charging,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}
}

//laser sight
scr_Laser_Sight();