follow_player = true;
buff = obj_player.buff_lasersight;
item_name = "Laser Sight";
item_description = "A laser is drawn from the bottom of the player to assist with aiming.";
add_sprite_to_list = true;
item_cost = 10;
max_uses = 1;

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}