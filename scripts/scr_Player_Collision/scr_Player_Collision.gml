// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Player_Collision(){
	//check for collision with one way ground
	if (place_meeting(x,y+vspeed,obj_ground_oneway) and !place_meeting(x,y-1,obj_ground_oneway)) and vspeed > 0 {
		while !(place_meeting(x,y+sign(vspeed),obj_ground_oneway)) {
			y += sign(vspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
	}
	
	//check for collision with ground x axis
	if (place_meeting(x+hspeed,y,obj_ground)) and free = true {
		while !(place_meeting(x+sign(hspeed),y,obj_ground)) {
			x += sign(hspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
	}
	
	//check for collision with ground y axis
	if (place_meeting(x,y+vspeed,obj_ground)) and free = true {
		while !(place_meeting(x,y+sign(vspeed),obj_ground)) {
			y += sign(vspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
	}
	
	//check for collision with on off platform	
	if (place_meeting(x,y+vspeed,obj_temp_platform_on_off) and !place_meeting(x,y-1,obj_temp_platform_on_off)) and vspeed > 0 and platform_on {
		while !(place_meeting(x,y+sign(vspeed),obj_temp_platform_on_off)) {
			y += sign(vspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
	}
	
	//check for collision with off on platform	
	if (place_meeting(x,y+vspeed,obj_temp_platform_off_on) and !place_meeting(x,y-1,obj_temp_platform_off_on)) and vspeed > 0 and !platform_on {
		while !(place_meeting(x,y+sign(vspeed),obj_temp_platform_off_on)) {
			y += sign(vspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
	}
	
	//unfreeze
	if state = state_bouncing {
		grv = init_grv;
		rotation_speed = original_rotation_speed;
		rotation_delay = rotation_speed / 10;
	}
}