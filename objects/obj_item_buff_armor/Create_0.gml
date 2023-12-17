follow_player = true;
buff = obj_player.buff_armor;
item_name = "Armored Heart";
item_description = "Adds an armored heart to the end of the player's healthbar.";
add_sprite_to_list = false;
item_cost = 10;
max_uses = 5;
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}