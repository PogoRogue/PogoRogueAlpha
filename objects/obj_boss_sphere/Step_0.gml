/// @description Handle movement


// Inherit the parent event
event_inherited();

if(place_meeting(x + hspeed, y, obj_ground)) {
	hspeed *= -1;
}

if(place_meeting(x, y + vspeed, obj_ground)) {
	vspeed *= -1;
}

image_angle -= 1;

