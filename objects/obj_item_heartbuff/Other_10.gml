event_inherited();

with obj_player {
	if hp < max_hp {
		obj_player.hp += 8;	
	}
}