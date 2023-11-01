/// @description Rotate to point to player

dist_to_player = distance_to_object(player);

// Check if the player is within range
if(!is_dead && dist_to_player < range) {
	// Only update if player is in the field of view as well
	can_see_player = !collision_line(x, y, player.x, player.y, obj_ground, false, true);
	if(can_see_player) {
		image_angle = point_direction(x, y, player.x, player.y);
		
		// Fire when ready
		weapon_cooldown--;
		if(weapon_cooldown <= 0) {
			//create bullet
			var _bullet = instance_create_layer(x, y, "Instances", obj_enemy_projectile_bullet);
			_bullet.direction = point_direction(x, y, player.x, player.y);
			_bullet.speed = bullet_speed;
			weapon_cooldown = cooldown_length;
		}
	}
}


// Inherit the parent event
event_inherited();

