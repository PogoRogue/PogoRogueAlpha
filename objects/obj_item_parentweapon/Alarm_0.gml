/// @description create item
with instance_create_depth(x,y,obj_player.depth-2,random_weapon_drop) {
	follow_player = true;
}

instance_destroy();