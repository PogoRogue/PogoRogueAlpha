/// @description Instantiate variables


// Inherit the parent event
event_inherited();

hp = 128;

hspeed = 0.5;
vspeed = 0.5;

// Spawn pieces
for(var i = -3; i < 4; i++) {
	for(var j = -3; j < 4; j++) {
		instance_create_layer(x + (i * 32), y + (j * 32), "enemies", obj_boss_sphere_piece_red);
	}
}
