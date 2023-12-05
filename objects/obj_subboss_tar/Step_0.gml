/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

// Move to top of surface if stuck in floor
while(place_meeting(x, y, obj_ground_parent)) {
	y--;
}	

// Fall or expand
if(!place_meeting(x, y + 1, obj_ground_parent)) {
	vspeed = vspeed+grav;
} else {
	vspeed = 0;
	image_xscale = min(image_xscale + 0.02, 2.0);	
	image_yscale = max(image_yscale - 0.01, 0.8);
	
	while(!place_meeting(x, y, obj_ground_parent)) {
		y++;
	}
}


if(place_meeting(x, y, obj_player)) {
	obj_player.vsp_basicjump = -3;
	is_touching_player = true;
} else if(is_touching_player){
	obj_player.vsp_basicjump = -6.6;
	is_touching_player = false;
}

if(is_despawning) {
	image_alpha *= 0.9;
}

if(image_index == 6) {
	image_speed = 0;
	image_index = 6;
}