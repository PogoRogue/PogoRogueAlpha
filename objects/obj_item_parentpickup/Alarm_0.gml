/// @description create item
with instance_create_depth(x,y+8,obj_player.depth-2,random_pickup_drop) {
	follow_player = true;
}

instance_destroy();