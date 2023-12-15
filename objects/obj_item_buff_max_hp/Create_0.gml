follow_player = true;
buff = obj_player.buff_max_hp;
item_name = "Max HP Buff";
item_description = "Permanently increases the player's HP";
add_sprite_to_list = false;
item_cost = 10;
max_uses = 5;

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}