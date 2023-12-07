/// @description Instantiate variables

// Inherit the parent event
event_inherited();

boss = instance_nearest(x, y, obj_boss_sphere);

x_off = boss.x - x;
y_off = boss.y - y;
angle = point_direction(boss.x, boss.y, x, y);
x_angle = cos(angle);
y_angle = sin(angle);

// sprite_set_offset(sprite_index, x - boss.x, y - boss.y);

