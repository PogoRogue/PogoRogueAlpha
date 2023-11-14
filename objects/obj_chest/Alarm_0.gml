/// @description Create coins

randomize();
var random_spawn_x = irandom_range(-16,16);

if (create_coins = true and num_of_coins > 0) {
	instance_create_depth(x+sprite_get_width(sprite_index)/2 + random_spawn_x,y-4,obj_player.depth-1,obj_coin);
	num_of_coins -= 1;
	alarm[0] = 2;
}else if num_of_coins <= 0 {
	create_coins = false;
}