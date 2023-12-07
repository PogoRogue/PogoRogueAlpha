/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 





// Inherit the parent event
event_inherited();

is_grounded = place_meeting(x, y + 1, obj_ground_parent);
at_wall = place_meeting(x + spd, y, obj_ground_parent);

if(is_grounded) {
	vspeed = 0;
	hspeed = 0;
	while(place_meeting(x, y, obj_ground_parent)) {
		y--;
	}
} else {
	vspeed += player.grv;
}

// When in range, jump towards the player
if(!is_dead && distance_to_object(player) < jump_range) {	
	// Jump towards player
	if (is_grounded) {
		// Face the player
		if(x < player.x) {
			spd = 0.5;
		} else {
			spd = -0.5;
		}
	
		if(jump_cooldown <= 0) {
			vspeed = jump_height;
			jump_cooldown = cooldown_length;
			hspeed = spd;
		}
	}
}

jump_cooldown = max(jump_cooldown - 1, 0);
