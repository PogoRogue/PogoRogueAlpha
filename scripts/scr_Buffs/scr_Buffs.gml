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
}