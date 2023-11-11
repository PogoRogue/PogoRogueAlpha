/// @description initialize variables
image_index = 0;
image_speed = 0;
damage = 4;
angle = image_angle;
hspd = lengthdir_x(spd,angle);
vspd = lengthdir_y(spd,angle);
max_num_of_bounces = num_of_bounces;


with instance_create_depth(x,y,depth-1,obj_projectile_flash_effect) {
	image_index = other.flash_frame;
	
	if (image_index < 4)  {
		alarm[0] = 4;
	}else {
		alarm[0] = 2;
	}
}

if destroy_time != 0 {
	alarm[0] = destroy_time;
}

//specific conditions
if (gun_name = "Bubble Gun") {
	spd += irandom_range(-4,0); //random speed for bubbles
	hspd = lengthdir_x(spd,angle);
	vspd = lengthdir_y(spd,angle);
}
if (gun_name = "Paintball Gun") {
	with obj_player {
		other.image_index = gun.bullets_per_bounce - gun.current_bullets;
	}
}
