follow_player = true;
buff = obj_player.buff_bouncybullets;
item_name = "Bouncy Bullets";
item_tagline = "Adds 1 bounce to every bullet.";
item_description = item_tagline;
add_sprite_to_list = true;
item_cost = 10;
max_uses = 1;
scr_Buff_Stats();

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}