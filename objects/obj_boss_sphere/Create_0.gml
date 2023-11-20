/// @description Instantiate variables

// Inherit the parent event
event_inherited();

depth = -5;
spd = 0.3;
rotation_spd = 0.5;
hp = 128;
hp_max = hp;

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
for(var i = -3; i < 4; i++) {
	for(var j = -3; j < 4; j++) {
		dist_from_center = abs(i) + abs(j);
		if(dist_from_center < 5) {
			switch(type) {
				case 0: 
					instance_create_layer(x + (i * 32), y + (j * 32), "enemies", obj_boss_brick_black);
					break;
				case 1: 
					instance_create_layer(x + (i * 32), y + (j * 32), "enemies", obj_boss_brick_blue);
					break;
				case 2: 
					instance_create_layer(x + (i * 32), y + (j * 32), "enemies", obj_boss_brick_red);
					break;
				case 3: 
					instance_create_layer(x + (i * 32), y + (j * 32), "enemies", obj_boss_brick_yellow);
					break;
			}
			type = irandom(3);
		}
	}
}