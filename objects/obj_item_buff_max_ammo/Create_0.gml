follow_player = true;
buff = obj_player.buff_max_ammo;
item_name = "Max Ammo Buff";
item_description = "Permanently increases the player's ammo";
add_sprite_to_list = true;
item_cost = 10;
max_uses = 5;

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}