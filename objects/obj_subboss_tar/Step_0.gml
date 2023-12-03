/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

if(!place_meeting(x, y + 1, obj_ground_parent)) {
	vspeed = vspeed+grav;
} else {
	vspeed = 0;
	image_xscale = min(image_xscale + 0.02, 3.0);	
	image_yscale = max( image_yscale - 0.01, 0.2);
	
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