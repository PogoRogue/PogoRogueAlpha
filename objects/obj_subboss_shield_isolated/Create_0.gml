/// @description Instantiate variables and create shield

// Inherit the parent event
event_inherited();

depth = -7;

spd = 0;

// Create shield object
shield = instance_create_layer(x, y, "enemies", obj_shield_respawning);
shield.parent = self;

