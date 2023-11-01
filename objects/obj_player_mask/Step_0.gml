/// @description check for collisions
//bounce off

colliding_with_ground = place_meeting(x,y,obj_ground);	
colliding_with_ground_left = place_meeting(x-2,y,obj_ground)
colliding_with_ground_right = place_meeting(x+2,y,obj_ground)

if (parent_index.state != parent_index.state_bouncing)

//left correct direction
if (place_meeting(x+parent_index.hspeed,y,obj_wallleft)) and parent_index.hspeed > 0 {
	parent_index.hspeed *= -0.5;
	//parent_index.state = state_wallstun;
}

//right correct direction
if (place_meeting(x+parent_index.hspeed,y,obj_wallright)) and parent_index.hspeed < 0 {
	parent_index.hspeed *= -0.5;
	//parent_index.state = state_wallstun;
}

//bottom
if (place_meeting(x,y+parent_index.vspeed,obj_wallbottom) and parent_index.vspeed < 0) {
	parent_index.vspeed *= -0.5;
}

//top left corner
if (place_meeting(x,y+parent_index.vspeed,obj_walltopleftcorner) and parent_index.vspeed > 0) {
	if (hspeed > 0) {
		parent_index.hspeed *= -0.5;
	}else {
		parent_index.hspeed = -2;
	}
	
	parent_index.vspeed *= -0.5;
}


//top right corner
if (place_meeting(x,y+parent_index.vspeed,obj_walltoprightcorner) and parent_index.vspeed > 0) {
	if (hspeed < 0) {
		parent_index.hspeed *= -0.5;
	}else {
		parent_index.hspeed = 2;
	}
	parent_index.vspeed *= -0.5;
}

