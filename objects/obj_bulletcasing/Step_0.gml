vspeed += 0.15;
image_angle += init_speed;

if place_meeting(x+hspeed,y,obj_ground) and bounced = false {
	bounces_left -= 1;
	hspeed *= -0.5
	bounced = true;
	alarm[0] = 2;
}

if place_meeting(x,y+vspeed,obj_ground_parent) and bounced = false {
	bounces_left -= 1;
	vspeed *= -0.5
	bounced = true;
	alarm[0] = 2;
}

if bounces_left <= 0 {
	instance_destroy();	
}