/// @description Instantiate variables

// Inherit the parent event
event_inherited();

// Instantiate additional variables
spd = 0.5;
at_edge = false;
at_wall = false;
is_grounded = false;
player = instance_nearest(x, y, obj_player);
jump_range = 100;
jump_cooldown = 0;
cooldown_length = 2 * room_speed;

// Add jump
jump_height = -6;

