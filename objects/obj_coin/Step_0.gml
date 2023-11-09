/// @description move towards player
if (instance_exists(obj_player)) {
	move_towards_point(obj_player.x,obj_player.y,spd);
	spd = lerp(spd,max_spd,0.05);
}

//destroy on contact
if (instance_exists(obj_player) and instance_exists(obj_player_mask)) {
	if place_meeting(x+hspeed,y+vspeed,obj_player) or place_meeting(x+hspeed,y+vspeed,obj_player_mask) {
		instance_destroy();
	}
}