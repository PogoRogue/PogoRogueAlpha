/// @description Instantiate variables

// Inherit the parent event
event_inherited();

// Layer in front of boss (-5)
depth = -6;

boss = instance_nearest(x, y, obj_boss_sphere);

// Position and rotation variables
boss_dir = point_direction(x, y, boss.x, boss.y);
boss_dir = degtorad(boss_dir);
dist = point_distance(x, y, boss.x, boss.y);
new_x = x;
new_y = y;
rad = degtorad(image_angle);
