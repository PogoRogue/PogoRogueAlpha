/// @description create extra coins
randomize();
if num_of_coins > 0 {
	instance_create_depth(x+irandom_range(-4,4),y+irandom_range(-4,4),depth,obj_coin);
	alarm[0] = time_between_spawns;
	num_of_coins -= 1;
}else {
	instance_destroy();
	if room = room_shop {
		obj_shop.cant_move = false;	
	}
}