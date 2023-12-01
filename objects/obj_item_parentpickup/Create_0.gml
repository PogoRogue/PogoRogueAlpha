event_inherited();

list_of_possible_pickups = [obj_item_pickup_chargejump,obj_item_pickup_groundpound,obj_item_pickup_hatgun];
random_pickup_drop = list_of_possible_pickups[irandom_range(0,array_length(list_of_possible_pickups)-1)];

with instance_create_depth(x-16,y-8,depth,random_pickup_drop) {
	follow_player = true;
}

pickup = obj_player.pickup_nothing;
item_name = "";
item_description = "";

instance_destroy();