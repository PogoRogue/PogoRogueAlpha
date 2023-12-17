/// @description Rotate around boss

// Inherit the parent event
if (drop == false)
{
	if (image_index==4)
	{
		sprite_index=spr_B1_Shield_Move
		drop = true
	}
}

if (drop == true)
{
event_inherited();

if(instance_exists(boss)) {
	// Update position and angle based off boss
	image_angle = point_direction(boss.x, boss.y, x, y);
	boss_dir += 0.008;

	new_x = boss.x - (cos(boss_dir) * dist);
	new_y = boss.y + (sin(boss_dir) * dist);

	direction = point_direction(x, y, new_x, new_y);
	speed = min(4.0, distance_to_point(new_x, new_y));
}
}