event_inherited();
follow_player = false;

list_of_possible_buffs = [obj_item_buff_lasersight, obj_item_buff_planetarybullets];
random_buff_drop = list_of_possible_buffs[irandom_range(0,array_length(list_of_possible_buffs)-1)];

buff = obj_player.buff_nothing;
item_name = "";
item_description = "";
add_sprite_to_list = true;