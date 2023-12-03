/// @description Instantiate varaibles

// Stats
hp = 8; 
hp_max = hp;
hp_percent = (hp / hp_max) * 100;
draw_hp = true;
damage = 8;
spd = 0;

// State
is_dead = false;
num_iframes = room_speed / 2;
current_iframes = 0;
red_frames = 0;

//drop chances
heart_chance = 20; //percent
buff_chance = 5; //percent
pickup_chance = 0; //percent
weapon_chance = 0; //percent

drop_coins = true;

num_of_coins = global.combo;