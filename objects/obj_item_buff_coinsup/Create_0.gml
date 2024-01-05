follow_player = true;
buff = obj_player.buff_coinsup;
item_name = "Coins Up";
item_tagline = "Earn an extra coin for each enemy you kill.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 10;
max_uses = 0;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}