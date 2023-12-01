key_left = keyboard_check(ord("A")) || keyboard_check(vk_left) || gamepad_axis_value(0,gp_axislh) < -0.5;
key_right = keyboard_check(ord("D")) || keyboard_check(vk_right) || gamepad_axis_value(0,gp_axislh) > 0.5;
key_select = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0,gp_face1);

if selected = false and fade_away = false {
	if key_left {
		if select > 1 {
			select -= 1;
		}
		selected = true;
	}
	if key_right {
		if select < num_of_slots {
			select += 1;
		}
		selected = true;
	}
}else {
	if !key_left and !key_right {
		selected = false;
	}
}

if key_select and fade_away = false {
	//slot 1
	if select = 1 {
		sprite_1 = sprite_new;
		sprite_new = spr_nothing;
		with obj_pause {
			paused_outside = true;	
		}
		//change gun
		instance_activate_object(obj_player);
		with obj_player {
			if other.pickups_mode = true {
				pickup_1 = other.new_item;
				pickups_array = [pickup_1, pickup_2];
			}else if other.weapons_mode = true  {
				gun_1 = other.new_item;
				gun_array = [gun_1, gun_2];
				gun = gun_array[current_gun];
			}
		}
	}
	//slot 2
	if select = 2 {
		sprite_2 = sprite_new;
		sprite_new = spr_nothing;
		with obj_pause {
			paused_outside = true;	
		}
		//change gun
		instance_activate_object(obj_player);
		with obj_player {
			if other.pickups_mode = true {
				pickup_2 = other.new_item;
				pickups_array = [pickup_1, pickup_2];
			}else if other.weapons_mode = true  {
				gun_2 = other.new_item;
				gun_array = [gun_1, gun_2];
				gun = gun_array[current_gun];
			}
		}
	}
	//cancel
	if select = num_of_slots {
		with obj_pause {
			paused_outside = true;	
		}
	}
	fade_away = true;
}

if fade_away = true {
	alpha -= 0.025	
	if alpha <= 0 {
		instance_destroy();	
	}
}

//get slot sprites
with obj_player {
	if other.pickups_mode = true {
		other.sprite_1 = pickup_1.gui_sprite;
		other.sprite_2 = pickup_2.gui_sprite;
	}else if other.weapons_mode = true {
		other.sprite_1 = gun_1.sprite;
		other.sprite_2 = gun_2.sprite;
	}
}

//get item sprite
if pickups_mode = true {
	sprite_new = new_item.gui_sprite;
}else if weapons_mode = true {
	sprite_new = new_item.sprite;
}