// Get HP values from player

if instance_number(obj_player_health) > 1 {
	instance_destroy();	
}

parent_index = instance_nearest(x,y,obj_player);

hp = parent_index.hp;
max_hp = parent_index.max_hp;
max_max_hp = parent_index.max_max_hp;
armor_buff = parent_index.armor_buff;
max_armor_buff = parent_index.max_armor_buff;