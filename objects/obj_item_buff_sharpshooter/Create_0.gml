follow_player = true;
buff = obj_player.buff_sharpshooter;
item_name = "Sharpshooter";
item_tagline = "Your first shot deals more damage.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 10;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}