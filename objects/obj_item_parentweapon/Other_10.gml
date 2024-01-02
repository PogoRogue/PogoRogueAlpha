// Inherit the parent event
event_inherited();

if weapon != obj_player.gun_1 and obj_player.weapons_equipped = 1
or weapon != obj_player.gun_1 and weapon != obj_player.gun_2 and obj_player.weapons_equipped = 2
or weapon != obj_player.gun_1 and weapon != obj_player.gun_2 and weapon != obj_player.gun_3 and obj_player.weapons_equipped = 3 {
	if obj_player.num_of_weapons = 1 or obj_player.num_of_weapons = 2 and obj_player.weapons_equipped = 1 {
		with obj_player {
			num_of_weapons = 2;
			gun_2 = other.weapon;
			gun_array = [gun_1,gun_2,gun_3];
			gun =  obj_player.gun_array[1];
			current_gun = 1;
		}
	}else if obj_player.num_of_weapons = 2 and obj_player.weapons_equipped = 2 {
		//create pop-up
		with instance_create_depth(x,y,depth,obj_item_swap) {
			pickups_mode = false;
			weapons_mode = true;
			sprite_1 = obj_player.gun_1.sprite;
			sprite_2 = obj_player.gun_2.sprite;
			new_item = other.weapon;
			item_name = other.item_name;
			item1_name = obj_player.gun_1._name;
			item2_name = obj_player.gun_2._name;
		}
	}else if obj_player.num_of_weapons = 3 and obj_player.weapons_equipped = 1 {
		with obj_player {
			num_of_weapons = 3;
			gun_2 = other.weapon;
			gun_array = [gun_1,gun_2,gun_3];
			gun =  obj_player.gun_array[1];
			current_gun = 1;
		}
	}else if obj_player.num_of_weapons = 3 and obj_player.weapons_equipped = 2 {
		with obj_player {
			num_of_weapons = 3;
			gun_3 = other.weapon;
			gun_array = [gun_1,gun_2,gun_3];
			gun =  obj_player.gun_array[2];
			current_gun = 2;
		}
	}else if obj_player.num_of_weapons = 3 and obj_player.weapons_equipped = 3 {
		//create pop-up
		with instance_create_depth(x,y,depth,obj_item_swap) {
			pickups_mode = false;
			weapons_mode = true;
			sprite_1 = obj_player.gun_1.sprite;
			sprite_2 = obj_player.gun_2.sprite;
			sprite_3 = obj_player.gun_3.sprite;
			new_item = other.weapon;
			item_name = other.item_name;
			item1_name = obj_player.gun_1._name;
			item2_name = obj_player.gun_2._name;
			item3_name = obj_player.gun_3._name;
		}
	}
}