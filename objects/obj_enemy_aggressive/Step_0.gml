/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();
is_grounded = instance_place(x, y, [obj_ground_parent]);
if (is_grounded <= 0) {
	vspeed = vspeed+0.1;
	is_falling = instance_place(x, y+vspeed, [obj_ground_parent]);
	if (is_falling > 0) {
		vspeed=0;
	}
}
