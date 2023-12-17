// Inherit the parent event
event_inherited();

if obj_player.armor_buff >= obj_player.max_armor_buff {
	sold_out = true;
}else {
	sold_out = false;	
}