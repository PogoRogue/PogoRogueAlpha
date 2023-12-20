event_inherited();
follow_player = false;

list_of_possible_pickups = [obj_item_pickup_chargejump,obj_item_pickup_groundpound,obj_item_pickup_hatgun,
							obj_item_pickup_shieldbubble,obj_item_pickup_firedash,obj_item_pickup_jetpack,
							obj_item_pickup_slowmo];
random_pickup_drop = list_of_possible_pickups[irandom_range(0,array_length(list_of_possible_pickups)-1)];

pickup = obj_player.pickup_nothing;
item_name = "";
item_description = "";