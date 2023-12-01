// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Random_Item_Drops(){
	randomize();

	//get center of enemy
	var center_x = x - sprite_get_xoffset(sprite_index) + sprite_width / 2;
	var center_y = y - sprite_get_yoffset( sprite_index) + sprite_height / 2;

	
	var heart_drop = irandom_range(1,100);
	var buff_drop = irandom_range(1,100);
	var weapon_drop = irandom_range(1,100);
	var pickup_drop = irandom_range(1,100);
	
	//heart
	if (heart_drop <= heart_chance) {
		with instance_create_depth(center_x,center_y,depth-1,obj_item_heartbuff) {
			follow_player = true;
		}
	}
	
	//buff
	if (buff_drop <= buff_chance) {
		with instance_create_depth(center_x,center_y,depth-1,obj_item_parentbuff) {
			follow_player = true;
		}
		//only one powerup per chest
		pickup_chance = -1;
		weapon_chance = -1;
	}
	
	//weapon
	if (weapon_drop <= weapon_chance) {
		with instance_create_depth(center_x,center_y,depth-1,obj_item_parentweapon) {
			follow_player = true;
		}
		//only one powerup per chest
		pickup_chance = -1;
	}
	
	//pickup
	if (pickup_drop <= pickup_chance) {
		with instance_create_depth(center_x,center_y,depth-1,obj_item_parentpickup) {
			follow_player = true;
		}
	}
}