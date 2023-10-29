/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
if(is_dead) {
	image_alpha *= 0.9;
} else if (hp <= 0) {
	is_dead = true;
	instance_create_layer(x,y,"Instances",obj_exposion)
	alarm_set(0, room_speed);
}
