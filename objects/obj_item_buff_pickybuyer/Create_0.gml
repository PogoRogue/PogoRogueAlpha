follow_player = true;
buff = obj_player.buff_pickybuyer;
item_name = "Picky Buyer";
item_tagline = "The first refresh in a shop is always free.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 10;
max_uses = 1;
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}