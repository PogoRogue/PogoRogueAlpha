// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Buffs(){
	buff_nothing = function() { }
	
	buff_heart = function() { 
		with obj_player {
			if hp < max_hp {
				obj_player.hp += 8;	
			}
		}
	}
	
	buff_lasersight = function() { 
		laser_sight = true;
	}
	
	buff_planetarybullets = function() { 
		if planetary_bullets < 5 {
			planetary_bullets += 1;
		}
		if !instance_exists(obj_planetarybullets) {
			instance_create_depth(x,y,depth,obj_planetarybullets);
		}
	}
	
	buff_armor = function(){
		with obj_player{
			obj_player.armor_buff += 20;
		}
	}
	
	buff_dmg = function(){
		with obj_player{
			obj_player.damage_buff += 10;
		}
	}
	
	buff_max_ammo = function(){
		with obj_player{
			obj_player.max_ammo_buff += 1;
		}
		scr_Increment_Max_Ammo();
	}
	
	buff_max_hp = function(){
		with obj_player{
			obj_player.max_hp += 5;
		}
	}
}