// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Buff_Replace() {
	if room = room_shop {
		for (j = 0; j < array_length(global.all_buff_sprites); j++) {
			if (sprite_index = global.all_buff_sprites[j] and global.all_buff_numbers[j] >= max_uses and max_uses != 0) {
				sold_out = true;
			}
		}
	}
}