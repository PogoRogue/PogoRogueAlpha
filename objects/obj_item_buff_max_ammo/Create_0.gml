follow_player = true;
buff = obj_player.buff_max_ammo;
item_name = "Ammo Up";
item_description = "Increases each weapon's max ammo by 1.";
add_sprite_to_list = true;
item_cost = 10;
max_uses = 5;
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}