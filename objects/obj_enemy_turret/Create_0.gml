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
rotation = 0;
is_vertical = true;
if(place_meeting(x + 20, y, obj_ground_parent)) {
	rotation = 180;
	is_vertical = true;
} else if (place_meeting(x, y + 20, obj_ground_parent)) {
	rotation = 90;
	is_vertical = false;
} else if (place_meeting(x, y - 20, obj_ground_parent)) {
	rotation = -90;
	is_vertical = false;
}

image_angle = rotation;

// Inherit the parent event
event_inherited();

