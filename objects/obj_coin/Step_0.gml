/// @description move towards player
if room != room_shop {
	follow_object = obj_player;
	follow_object2 = obj_player_mask;
}else {
	follow_object = obj_shopkeeper;	
	follow_object2 = obj_shopkeeper;
}

if (instance_exists(follow_object)) {
	move_towards_point(follow_object.x,follow_object.y,spd);
	spd = lerp(spd,max_spd,0.05);
}

//destroy on contact
if (instance_exists(follow_object) and instance_exists(follow_object2)) {
	if place_meeting(x+hspeed,y+vspeed,follow_object) or place_meeting(x+hspeed,y+vspeed,follow_object2) {
		instance_destroy();
	}
}