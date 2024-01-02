// Inherit the parent event

event_inherited();

if pickup != obj_player.pickup_1 and obj_player.num_of_pickups = 1
or pickup != obj_player.pickup_1 and pickup != obj_player.pickup_2 and obj_player.num_of_pickups = 2 
or obj_player.num_of_pickups = 0 {
	if obj_player.num_of_pickups = 0 {
		with obj_player {
			num_of_pickups = 1;
			pickup_1 = other.pickup;
			pickup_2 = pickup_nothing;
			pickups_array = [pickup_1,pickup_2];
		}
	}else if obj_player.num_of_pickups = 1 {
		with obj_player {
			num_of_pickups = 2;
			pickup_2 = other.pickup;
			pickups_array = [pickup_1,pickup_2];
		}
	}else if obj_player.num_of_pickups = 2 {
		//create pop-up
		with instance_create_depth(x,y,depth,obj_item_swap) {
			pickups_mode = true;
			weapons_mode = false;
			sprite_1 = obj_player.pickup_1.gui_sprite;
			sprite_2 = obj_player.pickup_2.gui_sprite;
			new_item = other.pickup;
			item_name = other.item_name;
			item1_name = obj_player.pickup_1._name;
			item2_name = obj_player.pickup_2._name;
		}
	}
}