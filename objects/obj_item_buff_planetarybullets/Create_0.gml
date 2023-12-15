image_speed = 0;
follow_player = true;
buff = obj_player.buff_planetarybullets;
item_name = "Planetary Bullets";
item_description = "Adds a bullet that circles the player to a maximum of 5.";
add_sprite_to_list = true;
item_cost = 20;
max_uses = 5;
if obj_player.planetary_bullets < max_uses {
	image_index = obj_player.planetary_bullets;
}else {
	image_index = max_uses-1;
}

if scr_In_Array(global.all_buffs, object_index) {
	scr_Buff_Replace();
}