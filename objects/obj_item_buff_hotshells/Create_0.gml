follow_player = true;
buff = obj_player.buff_hotshells;
item_name = "Hot Shells";
item_description = "Bullet casings hurt enemies on contact.";
add_sprite_to_list = true;
item_cost = 10;
max_uses = 1;
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}