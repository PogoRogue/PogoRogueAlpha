/// @description collisions and open states

//player collision
with (obj_player) {
	if (place_meeting(x,y+vspeed,other) and !place_meeting(x,y-1,other) and vspeed > 0) 
	or (place_meeting(x,y+1,other) and !place_meeting(x,y-1,other) and vspeed = 0) {
		other.image_index = 1;
		other.colliding = true;	
	}else if (other.colliding and other.open = false and state != state_bouncing and state != state_charging) {
		other.open = true;
		other.alarm[0] = 1;
	}
}

//projectile collision
with (obj_projectile) {
	if (place_meeting(x,y,other) and other.allow_projectile_collision) {
		other.open = true;
		other.alarm[0] = 1;
		instance_destroy();
	}
}

//open
if (open) {
	image_index = 2;
	create_coins = true;
}

