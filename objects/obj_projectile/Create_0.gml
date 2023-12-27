/// @description initialize variables
image_index = 0;
image_speed = 0;
angle = image_angle;
hspd = lengthdir_x(spd,angle);
vspd = lengthdir_y(spd,angle);
max_num_of_bounces = num_of_bounces;
init_damage = damage;
sound = audio_play_sound(snd_nothing,0,false);
colliding_with_enemy = false;

with instance_create_depth(x,y,depth-1,obj_projectile_flash_effect) {
	image_index = other.flash_frame;
	
	if (image_index < 4)  {
		alarm[0] = 2;
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
		other.image_index = ((gun.bullets_per_bounce + max_ammo_buff) - gun.current_bullets);
	}
}


if (gun_name = "Laser Gun") {
	laser_x = obj_player.x - x;
	laser_y = obj_player.y - y;
	full_sprite = spr_projectile_laser_start;
	init_sprite = sprite_index;
	laser_boost = false; //only apply momentum if this is true
	mask_index = spr_nothing;
	image_speed = 1;
	rotation_speed = obj_player.rotation_speed;
	
	//create rest of laser
	for (i = 2; i < 48; i++) {
		instance_create_depth(x+lengthdir_x(32*i,image_angle+180),y+lengthdir_y(32*i,image_angle+180),depth,obj_laser, {
			image_angle: image_angle,
			damage: damage,
			parent_obj: other,
			i: i,
			destroy_on_impact: destroy_on_impact,
			full_sprite: spr_projectile_laser,
			mask_index: spr_nothing,
			rotation_speed: rotation_speed
		});
	}
}

//missile
if (gun_name = "Missile Launcher") {
	sound = audio_play_sound(snd_rocketwhoosh,0,false);
	temp_angle = image_angle;
	if collision_circle(x,y,256,obj_enemy_parent,false,true) != noone {
		closest_enemy = instance_nearest(x,y,obj_enemy_parent);
	}else {
		closest_enemy = noone;
	}
}