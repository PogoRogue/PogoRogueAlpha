follow_player = true;
buff = obj_player.buff_armor;
item_name = "Armor Buff";
item_description = "Permanently increases the player's armor, which mitigates damage taken";
add_sprite_to_list = false;
item_cost = 10;
max_uses = 5;

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}