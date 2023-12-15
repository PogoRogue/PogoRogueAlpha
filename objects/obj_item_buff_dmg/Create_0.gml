follow_player = true;
buff = obj_player.buff_dmg;
item_name = "Damage Up";
item_description = "Increases the player's damage.";
add_sprite_to_list = true;
item_cost = 10;
max_uses = 0;
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}