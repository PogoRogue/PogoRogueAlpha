shop_index = global.shop_index;

if instance_number(obj_shop) > 1 {
	instance_destroy();
}else {
	global.shop_index += 1;	
}

global.player_spawn_x = obj_shop_door.x;
global.player_spawn_y = obj_shop_door.y - 64;

num_of_slots = 8;
refresh_button = false;
refresh_cost = 25;

default_item_1 = obj_item_buff_heart;
default_item_2 = obj_item_buff_heart;
buff_1 = obj_item_buff_lasersight;
buff_2 = obj_item_buff_planetarybullets;
buff_3 = obj_item_buff_armor;
buff_4 = obj_item_buff_dmg;
buff_6 = obj_item_max_ammo;
buff_5 = obj_item_buff_max_hp;

weapon_1 = obj_item_weapon_paintball;
weapon_2 = obj_item_weapon_shotgun;
pickup_1 = obj_item_pickup_groundpound;
pickup_2 = obj_item_pickup_hatgun;

slot_items_array = [default_item_1, default_item_2, buff_1, buff_2, weapon_1, weapon_2, pickup_1, pickup_2];
select = 1;
index = 0;
last_select = select;
selected_x = false;
selected_y = false;

created_items = false;
last_item_created = slot_items_array[0];
recreated_bought_item = false;
too_expensive = false;
cant_move = false;

item_name = "";
item_description = "";
item_cost = 0;