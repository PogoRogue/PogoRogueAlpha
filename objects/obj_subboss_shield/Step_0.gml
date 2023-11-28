/// @description Rotate around boss

// Inherit the parent event
event_inherited();

if(instance_exists(boss)) {
	// Update position and angle based off boss
	image_angle = point_direction(boss.x, boss.y, x, y);
	boss_dir += 0.008;

	new_x = boss.x - (cos(boss_dir) * dist);
	new_y = boss.y + (sin(boss_dir) * dist);

	if(distance_to_point(new_x, new_y) >= 0.1) {
		direction = point_direction(x, y, new_x, new_y);
		speed = 3.0;
	} else {
		x = new_x;
		y = new_y;
	}
}
