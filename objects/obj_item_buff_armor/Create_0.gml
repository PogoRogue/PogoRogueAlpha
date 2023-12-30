follow_player = true;
buff = obj_player.buff_armor;
item_name = "Armored Heart";
item_tagline = "Adds an armored heart to the end of the player's healthbar.";
item_description = item_tagline;
add_sprite_to_list = false;
item_cost = 10;
max_uses = 5;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}