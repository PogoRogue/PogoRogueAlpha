usable = true;
select = 1; //1 = passives, 2 = actives, 3 = weapons
select_max = 3; //max # of rows
select_x = 1; //passives only
select_x_max = 4; //number of columns
select_y = 0; //passives only
select_y_max = 4; //number of rows

selected_x = false;
selected_y = false;

with obj_pause {
	if pause = false {
		paused_outside = true;	
	}
}

instance_activate_object(obj_player);
with obj_player {
	//weapons
	other.gun_1 = gun_1;
	other.gun_2 = gun_2;
	other.gun_3 = gun_3;
	other.num_of_weapons = weapons_equipped;
	//pickups
	other.pickup_1 = pickup_1;
	other.pickup_2 = pickup_2;
	other.num_of_pickups = num_of_pickups;
}
if instance_exists(obj_pausemenu) {
	instance_deactivate_object(obj_player);
}