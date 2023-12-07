/// @description Move left and right and jump

// Inherit the parent event
event_inherited();

// Move left and right
at_edge = !collision_point(x + (sign(spd)), y + (sprite_height / 2), obj_ground_parent, false, false); 
at_wall = place_meeting(x + spd, y, obj_ground_parent);
is_grounded = place_meeting(x, y + 1, obj_ground_parent);

sprite_index = spr_enemy_moving_walk;

if (at_wall || (at_edge && is_grounded)) {
	spd *= -1;
	sprite_index = spr_enemy_moving;
}
if (spd == 0.5) { image_xscale = 1;}
if (spd == -0.5) { image_xscale = -1;}

if(is_dead) {
	spd = 0;	
}

hspeed = spd;

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
		}
	} else {
		hspeed = spd * 4;	
	}
}

jump_cooldown = max(jump_cooldown - 1, 0);