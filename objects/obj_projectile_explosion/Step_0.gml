if (floor(image_index) = sprite_get_number(sprite_index)-1) {
	instance_destroy();
}

//collision with player, send launching
if instance_exists(obj_player) {
	var player_x = obj_player.x+lengthdir_x(-24,obj_player.image_angle-90);
	var player_y = obj_player.y+lengthdir_y(-24,obj_player.image_angle-90);
	
	//launch player
	if (place_meeting(x-obj_player.hspeed,y-obj_player.vspeed,obj_player_mask) and launched = false)
	or (place_meeting(x-obj_player.hspeed,y-obj_player.vspeed,obj_player) and launched = false) {
		obj_player.speed = clamp(512/point_distance(x,y,player_x,player_y)+1,0,8);
		obj_player.direction = point_direction(x,y,player_x,player_y);
		obj_player.free = true;
		launched = true;
	}
}

// Only collide on 5th frame
if(image_index == 5) {
	mask_index = sprite_index;
} else {
	mask_index = spr_nothing;	
}