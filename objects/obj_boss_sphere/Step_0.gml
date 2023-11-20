/// @description Handle movement

// Inherit the parent event
event_inherited();

hspeed = spd * sign(hspeed);
vspeed = spd * sign(vspeed);

if(place_meeting(x + sign(hspeed), y, obj_ground)) {
	// hspeed *= -1;
}
if(place_meeting(x, y + sign(vspeed), obj_ground)) {
	// vspeed *= -1;
}

image_angle -= rotation_spd;
