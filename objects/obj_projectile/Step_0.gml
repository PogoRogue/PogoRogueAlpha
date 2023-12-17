x += hspd;
y += vspd;

//cant damage enemies if out of view
if instance_exists(obj_camera) {
	var camera_width = camera_get_view_width(view_camera[0])/2;
	var camera_height = camera_get_view_height(view_camera[0])/2;
	var padding = 128;

	if !(point_in_rectangle(x,y,obj_camera.x-camera_width-padding,obj_camera.y-camera_height-padding,obj_camera.x+camera_width+padding,obj_camera.y+camera_height+padding)) {
		damage = 0;
	}else {
		damage = init_damage;
		//damage buff for bouncy ball gun 
		if (gun_name = "Bouncy Ball Blaster") and num_of_bounces < max_num_of_bounces {
			damage = init_damage * (2*(max_num_of_bounces-num_of_bounces));
			image_index = max_num_of_bounces-num_of_bounces;
		}
	}
}

//destroy when touching ground
if (destroy_on_impact and num_of_bounces <= 0) {
	if (place_meeting(x,y,obj_ground)) {
		instance_destroy();
	}
}

//gravity
if (grav_affected) {
	vspd += grv;	
}

//rotate
if (gun_name = "Grenade Launcher") {
	image_angle -= hspd*2;
}

//bounces
//left
if ((place_meeting(x+hspd,y,obj_ground)) and hspd > 0 and num_of_bounces > 0) {
	hspd *= -bounce_amount;
	num_of_bounces -= 1;
	image_index = 1;
	alarm[1] = 3;
	if (gun_name = "Grenade Launcher") {
		audio_play_sound(snd_grenade_bounce, 0, false);
	}
}

//right
if ((place_meeting(x+hspd,y,obj_ground)) and hspd < 0 and num_of_bounces > 0) {
	hspd *= -bounce_amount;
	num_of_bounces -= 1;
	image_index = 1;
	alarm[1] = 5;
	if (gun_name = "Grenade Launcher") {
		audio_play_sound(snd_grenade_bounce, 0, false);
	}
}

//bottom
if ((place_meeting(x,y+vspd,obj_ground) and vspd < 0) and num_of_bounces > 0) {
	vspd *= -bounce_amount;
	num_of_bounces -= 1;
	image_index = 1;
	alarm[1] = 5;
	if (gun_name = "Grenade Launcher") {
		audio_play_sound(snd_grenade_bounce, 0, false);
	}
}

//top
if (place_meeting(x,y+vspd,obj_ground) and vspd > 0 and num_of_bounces > 0)
or (place_meeting(x,y+vspd,obj_ground_oneway) and !place_meeting(x,y-1,obj_ground_oneway) and vspd > 0 and num_of_bounces > 0) {
	vspd *= -bounce_amount;
	num_of_bounces -= 1;
	image_index = 1;
	alarm[1] = 5;
	if (gun_name = "Grenade Launcher") {
		audio_play_sound(snd_grenade_bounce, 0, false);
	}
}else if ((place_meeting(x,y+vspd,obj_ground_oneway) and !place_meeting(x,y-1,obj_ground_oneway) and vspd > 0) and num_of_bounces <= 0 and max_num_of_bounces > 0) 
or (place_meeting(x,y,obj_player_mask) and gun_name = "Grenade Launcher" and num_of_bounces <= 0) 
or (place_meeting(x,y,obj_player) and gun_name = "Grenade Launcher" and num_of_bounces <= 0) {
	instance_destroy();
}