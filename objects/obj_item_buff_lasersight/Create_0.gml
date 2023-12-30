follow_player = true;
buff = obj_player.buff_lasersight;
item_name = "Laser Sight";
item_tagline = "A laser is drawn from the bottom of the player to assist with aiming.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 10;
max_uses = 1;
item_stats = "";
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}