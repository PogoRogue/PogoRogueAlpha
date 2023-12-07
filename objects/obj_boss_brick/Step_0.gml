/// @description Track parent's movement

// Update position and angle based off boss
image_angle = boss.image_angle;
rad = degtorad(image_angle);

if(is_dead) {
	image_angle += random(15) - 7.5;
}

x = boss.x + (cos(rad - boss_dir) * dist);
y = boss.y - (sin(rad - boss_dir) * dist);


// Damage boss slightly when piece gets knocked off
if(hp <= 0 && damage != 0) {
	boss.hp--;
	damage = 0;
}

// If surrounded, brick cannot be damaged
if(collision_point(x + 32, y, obj_boss_brick, true, true)) {
	if(collision_point(x - 32, y, obj_boss_brick, true, true)) {
		if(collision_point(x, y + 32, obj_boss_brick, true, true)) {
			if(collision_point(x, y - 32, obj_boss_brick, true, true)) {
				hp = hp_max;
				is_dead = false;
			}
		}
	}
}

// Inherit the parent event
event_inherited();

draw_hp = hp < hp_max;
