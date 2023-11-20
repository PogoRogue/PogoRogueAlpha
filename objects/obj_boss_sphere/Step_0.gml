/// @description Handle movement

// Inherit the parent event
event_inherited();

hspeed = spd * sign(hspeed);
vspeed = spd * sign(vspeed);

image_angle -= rotation_spd;
