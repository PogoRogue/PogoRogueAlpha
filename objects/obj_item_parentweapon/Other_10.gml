// Inherit the parent event
event_inherited();

if weapon != obj_player.gun_1 and obj_player.num_of_weapons = 1
or weapon != obj_player.gun_1 and weapon != obj_player.gun_2 and obj_player.num_of_weapons = 2 {
	if obj_player.num_of_weapons = 1 {
		with obj_player {
			num_of_weapons = 2;
			gun_2 = other.weapon;
			gun_array = [gun_1,gun_2];
			gun =  obj_player.gun_array[1];
			current_gun = 1;
		}
	}else if obj_player.num_of_weapons = 2 {
		//create pop-up
		with instance_create_depth(x,y,depth,obj_item_swap) {
			pickups_mode = false;
			weapons_mode = true;
			sprite_1 = obj_player.gun_1.sprite;
			sprite_2 = obj_player.gun_2.sprite;
			new_item = other.weapon;
		}
	}
}