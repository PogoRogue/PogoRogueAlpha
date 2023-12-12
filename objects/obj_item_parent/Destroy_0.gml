/// @description shop spawn coins
if room = room_shop and create_coins = true {
	with instance_create_depth(obj_player_mask.x,obj_player_mask.y,obj_player_mask.depth-1,obj_coin_spawner) {
		num_of_coins = other.item_cost;
	}
}