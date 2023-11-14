/// @description Instantiate variables

// Position and rotation variables
player = instance_find(obj_player, 0);
dist_to_player = distance_to_object(player);
can_see_player = false;
range = 150;

// Weapon variables
bullet_speed = 5;
weapon_cooldown = 0;
cooldown_length = 1.5 * room_speed;

// Determine which surface the turret is on
rotation = -90;
if(collision_point(x + 16, y, obj_ground_parent, true, true)) {
	rotation = 180;
} else if (collision_point(x - 32, y, obj_ground_parent, true, true)) {
	rotation = 0;
} else if (collision_point(x, y -16, obj_ground_parent, true, true)) {
	rotation = 90;
}

image_angle = rotation;

// Inherit the parent event
event_inherited();

