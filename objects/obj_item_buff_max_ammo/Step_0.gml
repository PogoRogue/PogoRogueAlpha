// Inherit the parent event
event_inherited();

if obj_player.gun_1.bullets_per_bounce >= obj_player.gun_1.init_bullets_per_bounce + obj_player.gun_1.max_added_bullets
and obj_player.gun_2.bullets_per_bounce >= obj_player.gun_2.init_bullets_per_bounce + obj_player.gun_2.max_added_bullets {
	sold_out = true;
}else {
	sold_out = false;	
}