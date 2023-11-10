/// @description initialize variables
image_index = 0;
damage = 4;

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
}