/// @description Track parent's movement


// Inherit the parent event
event_inherited();

// Update position and angle based off boss
image_angle = boss.image_angle;
rad = degtorad(image_angle);

x = boss.x + (cos(rad - boss_dir) * dist);
y = boss.y - (sin(rad - boss_dir) * dist);


// Damage boss slightly when piece gets knocked off
if(hp <= 0 && damage != 0) {
	boss.hp--;
	damage = 0;
}

