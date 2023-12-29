// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Buffs(){
	buff_nothing = function() { }
	
	buff_heart = function() { 
		with obj_player {
			if hp < max_hp {
				hp += 8;	
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
		with obj_player {
			if armor_buff < max_armor_buff {
				armor_buff += 1;
			}
		}
	}
	
	buff_dmg = function(){
		with obj_player {
			damage_buff += 1;
		}
	}
	
	buff_max_ammo = function(){
		with obj_player {
			if gun_1.bullets_per_bounce < gun_1.init_bullets_per_bounce + gun_1.max_added_bullets {
				gun_1.bullets_per_bounce += 1;
				gun_1.current_bullets += 1;
			}
			if gun_2.bullets_per_bounce < gun_2.init_bullets_per_bounce + gun_2.max_added_bullets {
				gun_2.bullets_per_bounce += 1;
				gun_2.current_bullets += 1;
			}
		}
	}
	
	buff_max_hp = function(){
		with obj_player {
			if max_hp < max_max_hp {
				max_hp += 8;
			}
		}
	}
	
	buff_luck = function(){
		global.luck += 10;
	}
	
	buff_pickybuyer = function(){
		global.picky_buyer = true;	
	}
	
	buff_bouncybullets = function() {
		global.bouncy_bullets = 1;	
	}
	
	buff_hotshells = function(){
		global.hot_shells = true;	
	}
	
	buff_combomaster = function(){
		global.combo_master = true;	
	}
}