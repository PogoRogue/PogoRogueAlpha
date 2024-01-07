init_x = x;
init_y = y;
damage = 8;
slam_speed = 12; //pixels per frame to move while slamming
init_slam_speed = slam_speed; //pixels per frame to move while slamming
up_speed = slam_speed/4; //pixels per frame to move back up
init_up_speed = up_speed;
slammed_time = 60; //frames to spend in "slammed" position
waiting_time = 120; //frames to spend in "waiting" position
init_slammed_time = slammed_time;
init_waiting_time = waiting_time;
meeting_with_player = false;
on_screen = false;
arrow_index = 0;

image_speed = 0;
image_index = 0;


state_waiting = function() {
	x = init_x;
	y = init_y;
	slam_speed = 0;
	up_speed = 0;
			
	if waiting_time > 0 {
		waiting_time -= 1;
	}else if image_speed = 0 {
		image_speed = 1;
		image_index = 0;
	}
	
	if scr_Animation_Complete() {
		state = state_slamming;
		waiting_time = init_waiting_time;
		image_speed = 0;
		image_index = 0;
		
	}
}

state_slamming = function() {
	image_index = 1;
	
	//speed up
	if slam_speed < init_slam_speed {
		slam_speed += 0.5;
	}
	
	//move block
	if vertical = true {
		y += slam_speed * grav;
	}else {
		x += slam_speed * grav;
	}
	
	//check for collision
	if vertical = true {
		//y collision
		if place_meeting(x,y+slam_speed*grav,obj_ground) {
			while !(place_meeting(x,y+sign(slam_speed*grav),obj_ground)) {
				y += sign(slam_speed*grav);
			}
			slammed_time = init_slammed_time;
			if on_screen = true {
				scr_Screen_Shake(8,15);
			}	
			state = state_slammed;	
		}
	}else {
		//x collision
		if place_meeting(x+(slam_speed*grav),y,obj_ground) {
			while !(place_meeting(x+sign(slam_speed*grav),y,obj_ground)) {
				x += sign(slam_speed*grav);
			}
			slammed_time = init_slammed_time;
			if on_screen = true {
				scr_Screen_Shake(8,15);
			}
			state = state_slammed;
		}
	}
}

state_slammed = function() {
	image_index = 0;
	
	if slammed_time > 0 {
		slammed_time -= 1;
	}else {
		state = state_up;
		slammed_time = init_slammed_time;
	}
}

state_up = function() {
	if up_speed < init_up_speed {
		up_speed += 0.1;
	}
	if grav > 0 {
		if vertical = true and y > init_y {
			y -= up_speed;
			if y <= init_y {
				y = init_y;
			}
		}else if x > init_x {
			x -= up_speed;
			if x <= init_x {
				x = init_x;
			}
		}else {
			//back to original position
			x = init_x;
			y = init_y;
			state = state_waiting;
			waiting_time = init_waiting_time;
		}
	}else if grav < 0 {
		if vertical = true and y < init_y {
			y += up_speed;
			if y >= init_y {
				y = init_y;
			}
		}else if x < init_x {
			x += up_speed;
			if x >= init_x {
				x = init_x;
			}
		}else {
			//back to original position
			x = init_x;
			y = init_y;
			state = state_waiting;
			waiting_time = init_waiting_time;
		}
	}
}

state = state_waiting;