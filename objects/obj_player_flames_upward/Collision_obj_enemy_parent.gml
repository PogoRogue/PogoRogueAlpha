/// @description damage enemy

if(!other.is_dead && other.current_iframes <= 0 && !array_contains(damaged_list, other)) {
	other.hp -= damage;
	other.red_frames = 10;
	if other.hp <= 0 {
		obj_player.pickup_firedash.cooldown_time = 0;
	}
	damaged_list = array_concat(damaged_list, [other]);
}