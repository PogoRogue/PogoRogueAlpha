/// @description for testing purposes
with instance_create_depth(x,y,depth,obj_item_swap) {
	
	randomize();
	pickups_mode = choose(true,false);
	weapons_mode = not pickups_mode;
	
	if pickups_mode = true {
		new_item = other.all_pickups_array[irandom_range(0,array_length(other.all_pickups_array)-1)];	
	}else if weapons_mode = true {
		new_item = other.all_guns_array[irandom_range(0,array_length(other.all_guns_array)-1)];	
	}
	
	
}