event_inherited();
follow_player = false;

list_of_possible_buffs = [obj_item_buff_lasersight, obj_item_buff_planetarybullets, obj_item_buff_armor, 
							obj_item_buff_dmg, obj_item_buff_max_ammo, obj_item_buff_max_hp];
random_buff_drop = list_of_possible_buffs[irandom_range(0,array_length(list_of_possible_buffs)-1)];

buff = obj_player.buff_nothing;
item_name = "";
item_description = "";
add_sprite_to_list = true;
max_uses = 0; //how many times this buff can be picked up, 0 = infinite