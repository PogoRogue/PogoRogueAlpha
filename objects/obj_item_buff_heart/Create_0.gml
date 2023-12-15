follow_player = false;
buff = obj_player.buff_heart;
item_name = "Heart";
item_description = "Gives the player one extra heart.";
add_sprite_to_list = false;
item_cost = 10;
max_uses = 0;

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}

