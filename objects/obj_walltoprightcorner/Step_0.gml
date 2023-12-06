// Inherit the parent event
event_inherited();

if position_meeting(x-(sprite_width/2)*image_xscale,y-1,obj_ground) or position_meeting(x+1,y+(sprite_height/2)*image_xscale,obj_ground) {
	instance_destroy();	
}