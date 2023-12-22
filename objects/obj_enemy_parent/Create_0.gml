/// @description Instantiate varaibles

// Stats
hp = 8; 
hp_max = hp;
hp_percent = (hp / hp_max) * 100;
draw_hp = true;
damage = 8;
spd = 0;

stomp_defense = 1; // This is a scalar that gets applied to stomp damage
bullet_defense = 1; // This is a scalar that gets applied to bullet damage

// State
is_dead = false;
num_iframes = room_speed / 2;
current_iframes = 0;
red_frames = 0;

//drop chances
heart_chance = 10 + (global.luck/2); //percent
buff_chance = 5 + (global.luck/2); //percent
pickup_chance = (global.luck/2); //percent
weapon_chance = (global.luck/2); //percent

drop_coins = true;

num_of_coins = global.combo;