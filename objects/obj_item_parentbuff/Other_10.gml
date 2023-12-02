// Inherit the parent event
event_inherited();

buff();

//add buff sprite to ui
if !scr_In_Array(obj_player.all_buff_sprites,sprite_index) and add_sprite_to_list = true {
	array_resize(obj_player.all_buff_sprites,array_length(obj_player.all_buff_sprites)+1);
	array_resize(obj_player.all_buff_sprites_index,array_length(obj_player.all_buff_sprites_index)+1);
	obj_player.all_buff_sprites[array_length(obj_player.all_buff_sprites)-1] = sprite_index;
}else if add_sprite_to_list = true {
	for (i = 0; i < array_length(obj_player.all_buff_sprites); i++) {
		if obj_player.all_buff_sprites[i] = sprite_index {
			obj_player.all_buff_sprites_index[i] = image_index;
		}
	}
}