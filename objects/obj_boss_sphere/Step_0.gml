/// @description Handle movement


if(!is_dead) {
	hspeed = spd * sign(hspeed);
	vspeed = spd * sign(vspeed);
} else {
	hspeed = 0;
	vspeed = 0;
}

image_angle -= rotation_spd;

// If surrounded, brick cannot be damaged
if(instance_place_list(x, y, obj_boss_brick, ds_list_create(), false) >= 9) {
	hp = hp_max;
	is_dead = false;
}

// Inherit the parent event
event_inherited();
