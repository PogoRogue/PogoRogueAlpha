/// @description Instantiate variables

// Inherit the parent event
event_inherited();

depth = -5;
spd = 0.3;
rotation_spd = 0.5;
hp = 128;
hp_max = hp;
draw_hp = false;

vspeed = spd;
hspeed = spd;

// Healthbar dimensions
view_width = camera_get_view_width(view_camera[0]);
view_height = camera_get_view_height(view_camera[0]);
left_border = 100;
top_border = view_height - 20;
right_border = view_width - 100;
bottom_border = view_height - 15;
hp_percent = (hp / hp_max) * 100;

// Spawn pieces
dist_from_center = 0;
type = irandom(3);
type_index = noone;
for(var _i = -3; _i < 4; _i++) {
	for(var _j = -3; _j < 4; _j++) {
		dist_from_center = abs(_i) + abs(_j);
		if(dist_from_center < 5) {
			switch(type) {
				case 0: 
					type_index = obj_boss_brick_black;
					break;
				case 1: 
					type_index = obj_boss_brick_blue;
					break;
				case 2:
					type_index = obj_boss_brick_red;
					break;
				case 3:
					type_index = obj_boss_brick_yellow;
					break;
			}
			
			instance_create_layer(x + (_i * 32), y + (_j * 32), "enemies", type_index);
			type = irandom(3);
		}
	}
}