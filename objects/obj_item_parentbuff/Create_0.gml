event_inherited();

list_of_possible_buffs = [0,0];
random_buff_drop = list_of_possible_buffs[irandom_range(0,array_length(list_of_possible_buffs)-1)];
with instance_create_depth(x,y,depth,random_buff_drop) {
	follow_player = true;
}

//buff = obj_player.buff_nothing;
item_name = "";
item_description = "";