x += hspd;
y += vspd;

var padding = 64;
//if !(point_in_rectangle(x,y,-padding,-padding,room_width+padding,room_height+padding)) {
//	instance_destroy(); //destroy if outside room
//}

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
if ((place_meeting(x+hspd,y,obj_wallleft)) and hspd > 0 and num_of_bounces > 0) {
	hspd *= -bounce_amount;
	num_of_bounces -= 1;
	image_index = 1;
	alarm[1] = 3;
}

//right
if ((place_meeting(x+hspd,y,obj_wallright)) and hspd < 0 and num_of_bounces > 0) {
	hspd *= -bounce_amount;
	num_of_bounces -= 1;
	image_index = 1;
	alarm[1] = 5;
}

//bottom
if ((place_meeting(x,y+vspd,obj_wallbottom) and vspd < 0) and num_of_bounces > 0) {
	vspd *= -bounce_amount;
	num_of_bounces -= 1;
	image_index = 1;
	alarm[1] = 5;
}

//top
if (place_meeting(x,y+vspd,obj_ground) and vspd > 0 and num_of_bounces > 0)
or (place_meeting(x,y+vspd,obj_ground_oneway) and !place_meeting(x,y-1,obj_ground_oneway) and vspd > 0 and num_of_bounces > 0) {
	vspd *= -bounce_amount;
	num_of_bounces -= 1;
	image_index = 1;
	alarm[1] = 5;
}else if ((place_meeting(x,y+vspd,obj_ground_oneway) and !place_meeting(x,y-1,obj_ground_oneway) and vspd > 0) and num_of_bounces <= 0 and max_num_of_bounces > 0) 
or (place_meeting(x,y,obj_player_mask) and gun_name = "Grenade Launcher" and num_of_bounces <= 0) 
or (place_meeting(x,y,obj_player) and gun_name = "Grenade Launcher" and num_of_bounces <= 0) {
	instance_destroy();
}