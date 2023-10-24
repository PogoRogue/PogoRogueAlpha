var _item = other;
var trigger_chance = irandom_range(1, 100);
if (trigger_chance <= _item.percentage) {
    speed = speed + _item.add_speed;
    current_weapon[0] = current_weapon[0] + _item.add_numberofbullets;
    projectiles_left = current_weapon[0];
}

instance_destroy(other);




