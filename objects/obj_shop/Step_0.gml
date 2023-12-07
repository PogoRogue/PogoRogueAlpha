if cant_move = false {
	key_left = keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left) || gamepad_axis_value(0,gp_axislh) < -0.5;
	key_right = keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right) || gamepad_axis_value(0,gp_axislh) > 0.5;
	key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up) || gamepad_axis_value(0,gp_axislv) < -0.5;
	key_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down) || gamepad_axis_value(0,gp_axislv) > 0.5;
	key_select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0,gp_face1);
}else {
	key_left = 0;
	key_right = 0;
	key_up = 0;
	key_down = 0;
	key_select = 0;
}


if selected_x = false {
	if key_left and select % 2 = 0 {
		if select != 0 {
			select -= 1;	
		}else {
			select = last_select;	
		}
		selected_x = true;
	}else if key_right and select % 2 != 0 {
		select += 1;
		selected_x = true;
	}
}else {
	if !key_left and !key_right {
		selected_x = false;
	}
}

if selected_y = false {
	if key_up and select > 2 {
		selected_y = true;
		if refresh_button = true {
			refresh_button = false;	
		}else {
			select -= 2;	
		}
	}else if key_down and select < 7 {
		select += 2;	
		selected_y = true;
	}else if key_down {
		if refresh_button = false {
			refresh_button = true;	
		}
	}
}else {
	if !key_up and !key_down {
		selected_y = false;
	}
}


//create items
var xx = 0;
var yy = 0;
if created_items = false {
	//choose random items
	randomize();

	buff_1 = global.all_buffs[irandom_range(0,array_length(global.all_buffs)-1)];
	buff_2 = global.all_buffs[irandom_range(0,array_length(global.all_buffs)-1)];
	while (buff_2 = buff_1) { //dont want 2 of the same buff
		buff_2 = global.all_buffs[irandom_range(0,array_length(global.all_buffs)-1)];
	}

	weapon_1 = global.all_weapons[irandom_range(0,array_length(global.all_weapons)-1)];
	weapon_2 = global.all_weapons[irandom_range(0,array_length(global.all_weapons)-1)];
	while (weapon_2 = weapon_1) { //dont want 2 of the same weapon
		weapon_2 = global.all_weapons[irandom_range(0,array_length(global.all_weapons)-1)];
	}

	pickup_1 = global.all_pickups[irandom_range(0,array_length(global.all_pickups)-1)];
	pickup_2 = global.all_pickups[irandom_range(0,array_length(global.all_pickups)-1)];
	while (pickup_2 = pickup_1) { //dont want 2 of the same pickup
		pickup_2 = global.all_pickups[irandom_range(0,array_length(global.all_pickups)-1)];
	}

	slot_items_array = [default_item_1, default_item_2, buff_1, buff_2, weapon_1, weapon_2, pickup_1, pickup_2];
	
	//create items 
	for (i = 0; i < array_length(slot_items_array); i++) {
		index = i;
		if i % 2 = 0 {
			xx = 304;
		}else {
			xx = 368;
		}
		yy = 120 + 64 * floor(i / 2);
		with instance_create_depth(xx,yy,depth-1,slot_items_array[i]) {
			follow_player = false;
			index = other.index;
		}
		
		//replace weapon with new weapon if player already has it
		if i = 4 
		or i = 5 {
			while (obj_player.gun_array[0] = slot_items_array[i].weapon or obj_player.gun_array[1] = slot_items_array[i].weapon) {
				if obj_player.gun_array[0] = slot_items_array[i].weapon or obj_player.gun_array[1] = slot_items_array[i].weapon {
					//destroy old item
					slot_items_array[i].item_cost = 0;
					instance_destroy(slot_items_array[i]);
				}
				
				slot_items_array[i] = global.all_weapons[irandom_range(0,array_length(global.all_weapons)-1)];
				while slot_items_array[4] = slot_items_array[5] { //change if 2 of same item
					slot_items_array[i] = global.all_weapons[irandom_range(0,array_length(global.all_weapons)-1)];
				}
				with instance_create_depth(xx,yy,depth-1,slot_items_array[i]) {
					follow_player = false;
					index = other.index;
				}
			}
		}
		//replace pickup with new pickup if player already has it
		if i = 6 
		or i = 7 {
			while (obj_player.pickups_array[0] = slot_items_array[i].pickup or obj_player.pickups_array[1] = slot_items_array[i].pickup) {
				if obj_player.pickups_array[0] = slot_items_array[i].pickup or obj_player.pickups_array[1] = slot_items_array[i].pickup {
					//destroy old item
					slot_items_array[i].item_cost = 0;
					instance_destroy(slot_items_array[i]);
				}
				
				slot_items_array[i] = global.all_pickups[irandom_range(0,array_length(global.all_pickups)-1)];
				while slot_items_array[6] = slot_items_array[7] { //change if 2 of same item
					slot_items_array[i] = global.all_pickups[irandom_range(0,array_length(global.all_pickups)-1)];
				}
				with instance_create_depth(xx,yy,depth-1,slot_items_array[i]) {
					follow_player = false;
					index = other.index;
				}
			}
		}
		
	}
	created_items = true;
}

//get item info
if select != 0 {
	if instance_exists(slot_items_array[select-1]) {
		item_name = slot_items_array[select-1].item_name;
		item_description = slot_items_array[select-1].item_description;
		item_cost = slot_items_array[select-1].item_cost;
		
		if global.num_of_coins >= slot_items_array[select-1].item_cost {
			too_expensive = false;
		}else {
			too_expensive = true;
		}
	}else {
		item_name = "";
		item_description = "";
	}
}

//select item 
if key_select {
	if select != 0 and instance_exists(slot_items_array[select-1]) and refresh_button = false {
		last_select = select;
		select = 0;
	}else if select = 0 and refresh_button = false {
		select = last_select;
		if global.num_of_coins >= slot_items_array[last_select-1].item_cost {
			//item follow player
			last_item_created = slot_items_array[select-1];
			audio_play_sound(snd_chaching,0,false);
			with slot_items_array[select-1] {
				if (index = other.select-1) {
					follow_player = true;
					depth -= 1;
					other.cant_move = true;
				}
			}
		}
	}else if refresh_button = true {
		if global.num_of_coins >= refresh_cost {
			with instance_create_depth(obj_player_mask.x,obj_player_mask.y,obj_player_mask.depth-1,obj_coin_spawner) {
				num_of_coins = other.refresh_cost;
			}
			with obj_item_parent {
				select = other.select;
				refresh_button = other.refresh_button;
				create_coins = false;
				instance_destroy();	
			}
			instance_destroy();
			instance_create_depth(x,y,depth,obj_shop);
		}
	}
}

//if item canceled on item swap pop up
if recreated_bought_item = true {
	if (select-1) % 2 = 0 {
		xx = 304;
	}else {
		xx = 368;
	}
	yy = 120 + 64 * floor((select-1) / 2);
	with instance_create_depth(xx,yy,depth-1,last_item_created) {
		index = other.select-1;
		follow_player = false;
	}
	recreated_bought_item = false;
}