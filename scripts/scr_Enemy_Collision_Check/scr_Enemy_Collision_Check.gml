// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Enemy_Collision_Check(condition){
	if place_meeting(x,y+vspeed,obj_enemy_parent) and condition = true {
		while !(place_meeting(x,y+sign(vspeed),obj_enemy_parent)) {
			y += sign(vspeed);
		}
		with instance_place(x,y+1,obj_enemy_parent) {
			if object_get_parent(object_index) != obj_enemy_shoot_only and object_index != obj_enemy_shoot_only {
				if (!is_dead && current_iframes <= 0 && other.current_iframes <= 0) {
					other.state = other.state_bouncing;
					other.speed = 0;
					hp -= other.stomp_damage;
					red_frames = 10;
					current_iframes = num_iframes;
					
					// For Sphere boss, change its direction when you hit it from above
					if(object_index == obj_boss_sphere) {
						x_diff = x - other.x;
						y_diff = y - other.y;
						if(x_diff <= y_diff) {
							vspeed = 1;
						}
					}
				}
			}else {
				other.state = other.state_bouncing;
				other.speed = 0;	
			}
		}
	}
}