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
	
	//destroy if far enough away from camera
	if  !(point_in_rectangle(x,y,obj_camera.x-camera_width-(padding*10),obj_camera.y-camera_height-(padding*10),obj_camera.x+camera_width+(padding*10),obj_camera.y+camera_height+(padding*10))) {
		instance_destroy();
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
	if (gun_name = "Grenade Launcher") {
		audio_play_sound(snd_grenade_bounce, 0, false);
		image_index = 1;
		alarm[1] = 3;
	}else {
		image_angle = point_direction(x,y,x+hspd,y+vspd);
	}
}

//right
if ((place_meeting(x+hspd,y,obj_ground)) and hspd < 0 and num_of_bounces > 0) {
	hspd *= -bounce_amount;
	num_of_bounces -= 1;
	if (gun_name = "Grenade Launcher") {
		audio_play_sound(snd_grenade_bounce, 0, false);
		image_index = 1;
		alarm[1] = 5;
	}else {
		image_angle = point_direction(x,y,x+hspd,y+vspd);	
	}
}

//bottom
if ((place_meeting(x,y+vspd,obj_ground) and vspd < 0) and num_of_bounces > 0) {
	vspd *= -bounce_amount;
	num_of_bounces -= 1;
	if (gun_name = "Grenade Launcher") {
		audio_play_sound(snd_grenade_bounce, 0, false);
		image_index = 1;
		alarm[1] = 5;
	}else {
		image_angle = point_direction(x,y,x+hspd,y+vspd);
	}
}

//top
if (place_meeting(x,y+vspd,obj_ground) and vspd > 0 and num_of_bounces > 0)
or (place_meeting(x,y+vspd,obj_ground_oneway) and !place_meeting(x,y-1,obj_ground_oneway) and vspd > 0 and num_of_bounces > 0) {
	vspd *= -bounce_amount;
	num_of_bounces -= 1;
	if (gun_name = "Grenade Launcher") {
		audio_play_sound(snd_grenade_bounce, 0, false);
		image_index = 1;
		alarm[1] = 5;
	}else {
		image_angle = point_direction(x,y,x+hspd,y+vspd);
	}
}else if ((place_meeting(x,y+vspd,obj_ground_oneway) and !place_meeting(x,y-1,obj_ground_oneway) and vspd > 0) and num_of_bounces <= 0 and max_num_of_bounces > 0) 
or (place_meeting(x,y,obj_player_mask) and gun_name = "Grenade Launcher") 
or (place_meeting(x,y,obj_player) and gun_name = "Grenade Launcher") {
	instance_destroy();
}

//missile
if (gun_name = "Missile Launcher") {
	//speed up
	if speed < 8 {
		speed += 0.25;	
	}
	
	//lock on to enemy
	if collision_circle(x,y,196,obj_enemy_parent,false,true) != noone {
		closest_enemy = instance_nearest(x,y,obj_enemy_parent);
	}else {
		closest_enemy = noone;
	}
	
	//rotate
	if closest_enemy != noone {
		damage = init_damage;
		destroy_on_impact = false;
		scr_Gradually_Turn(self.id,closest_enemy,45,1);
		direction = image_angle;
		if place_meeting(x,y,closest_enemy) {
			instance_destroy();	
		}
	}else {
		destroy_on_impact = true;
		direction = image_angle;
		
		if place_meeting(x,y+vspeed,obj_ground_oneway) and !place_meeting(x,y,obj_ground_oneway) and vspeed > 0 and num_of_bounces <= 0 {
			instance_destroy();	
		}else if place_meeting(x,y+vspeed,obj_ground_oneway) and !place_meeting(x,y,obj_ground_oneway) and vspeed > 0 {
			image_angle = point_direction(x,y,x+hspeed,y-vspeed);
			direction = image_angle;
			num_of_bounces -= 1;
		}
		if place_meeting(x+hspeed,y,obj_ground) and num_of_bounces > 0 {
			image_angle = point_direction(x,y,x-hspeed,y+vspeed);
			direction = image_angle;
			num_of_bounces -= 1;
		}
		if place_meeting(x,y+vspeed,obj_ground) and num_of_bounces > 0 {
			image_angle = point_direction(x,y,x+hspeed,y-vspeed);
			direction = image_angle;
			num_of_bounces -= 1;
		}
	}
}

if (gun_name = "Boomerangs") {
	hspd = 0;
	vspd = 0;
	image_angle += 20;
	if spd > 0 {
		spd -= 0.25;
		speed = spd;
		direction = angle;
		if spd <= 0 {
			colliding_with_enemy = false;
		}
	}else {
		speed = 0;
		spd -= 0.25;
		move_towards_point(obj_player.x,obj_player.y,abs(spd));
		//collision with player
		if place_meeting(x,y,obj_player) or place_meeting(x,y,obj_player_mask) {
			instance_destroy();
			audio_play_sound(snd_reload,0,false);
			with obj_player {
				if gun_1._name = "Boomerangs" {
					if gun_1.current_bullets < gun_1.bullets_per_bounce+obj_player.max_ammo_buff {
						gun_1.current_bullets += 1;
					}
				}else if gun_2._name = "Boomerangs" {
					if gun_2.current_bullets < gun_2.bullets_per_bounce+obj_player.max_ammo_buff {
						gun_2.current_bullets += 1;
					}
				}else if gun_3._name = "Boomerangs" {
					if gun_3.current_bullets < gun_3.bullets_per_bounce+obj_player.max_ammo_buff {
						gun_3.current_bullets += 1;
					}
				}
			}
		}
	}
	//damage enemy only once each direction
	if colliding_with_enemy = true {
		damage = 0 - global.damage_buff;
		if !place_meeting(x,y,obj_enemy_parent) {
			colliding_with_enemy = false;
		}
	}else {
		damage = init_damage;	
	}
}

if (gun_name = "Star Sucker") {
	hspd = 0;
	vspd = 0;
	spd += 0.1;
	move_towards_point(obj_player.x,obj_player.y,spd);
	
	if place_meeting(x,y,obj_player) or place_meeting(x,y,obj_player_mask) {
		instance_destroy();
	}
	
	//damage once per enemy
	if place_meeting(x,y,obj_enemy_parent) {
		colliding_with_enemy = true;
		damage = 0;
	}else {
		damage = init_damage;	
	}
	
	//end animation
	if !scr_Animation_Complete() {
		image_index += 0.5;	
	}
}