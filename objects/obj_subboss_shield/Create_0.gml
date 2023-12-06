/// @description Instantiate variables and create shield

// Inherit the parent event
event_inherited();

depth = -7;

drop = false

boss = instance_nearest(x, y, obj_boss_sphere);

// Position and rotation variables
boss_dir = point_direction(x, y, boss.x, boss.y);
boss_dir = degtorad(boss_dir);
dist = 180;
new_x = x;
new_y = y;
rad = degtorad(image_angle);

// Create shield object
shield = instance_create_layer(x, y, "enemies", obj_shield_respawning);
shield.parent = self;