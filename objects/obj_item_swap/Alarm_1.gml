/// @description dont lose any coins in shop
if room = room_shop {
	with obj_coin_spawner {
		instance_destroy();	
	}
	with obj_shop {
		recreated_bought_item = true;
		obj_shop.cant_move = false;
	}
}