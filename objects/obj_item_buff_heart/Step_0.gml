// Inherit the parent event
event_inherited();

if obj_player.hp >= obj_player.max_hp {
	sold_out = true;
}else {
	sold_out = false;	
}