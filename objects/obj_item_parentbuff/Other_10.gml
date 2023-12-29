// Inherit the parent event
event_inherited();

buff();

//add buff sprite to ui
if !scr_In_Array(global.all_buff_sprites,sprite_index) and add_sprite_to_list = true {
	array_resize(global.all_buff_sprites,array_length(global.all_buff_sprites)+1);
	array_resize(global.all_buff_sprites_index,array_length(global.all_buff_sprites_index)+1);
	array_resize(global.all_buff_numbers,array_length(global.all_buff_numbers)+1);
	array_resize(global.all_buff_names,array_length(global.all_buff_names)+1);
	array_resize(global.all_buff_descriptions,array_length(global.all_buff_descriptions)+1);
	array_resize(global.all_buff_stats,array_length(global.all_buff_stats)+1);
	global.all_buff_sprites[array_length(global.all_buff_sprites)-1] = sprite_index;
	global.all_buff_numbers[array_length(global.all_buff_numbers)-1] = 1;
	global.all_buff_names[array_length(global.all_buff_names)-1] = item_name;
	global.all_buff_descriptions[array_length(global.all_buff_descriptions)-1] = item_tagline;
	global.all_buff_stats[array_length(global.all_buff_stats)-1] = item_stats;
}else if add_sprite_to_list = true {
	for (i = 0; i < array_length(global.all_buff_sprites); i++) {
		if global.all_buff_sprites[i] = sprite_index {
			//update image index
			global.all_buff_sprites_index[i] = image_index;
			//update numbers
			if global.all_buff_numbers[i] < max_uses and max_uses > 0 {
				global.all_buff_numbers[i] += 1;
			}else if max_uses <= 0 {
				global.all_buff_numbers[i] += 1;
			}
		}
	}
}