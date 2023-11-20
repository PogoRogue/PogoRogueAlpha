/// @description Track parent's movement


// Inherit the parent event
event_inherited();

// Update position and angle based off boss
image_angle = boss.image_angle;
rad = degtorad(image_angle);

new_x = boss.x + (cos(rad - boss_dir) * dist);
new_y = boss.y - (sin(rad - boss_dir) * dist);

// Bounce off walls
if(place_meeting(x + (3 * sign(boss.hspeed)), y, obj_ground)) {
	// boss.hspeed *= -1;
}
if(place_meeting(x, y + (3 * sign(boss.vspeed)), obj_ground)) {
	// boss.vspeed *= -1;
}

x = new_x;
y = new_y;

if(hp <= 0 && damage != 0) {
	boss.hp--;
	damage = 0;
}

