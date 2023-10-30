// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Shoot_Arm_Cannon(){
	with obj_arm_cannon {
		//play sound
		//audio_play_sound(gun.sound,10,false,random_range(0.8,1),0,random_range(0.8,1)); //play shooting sound, randomize gain and pitch
		
		//calculate distance from center to tip of gun
		var dist = sprite_get_width(gun.sprite) - sprite_get_xoffset(gun.sprite);
		
		for (var i = 0; i < gun.spread_number; i++;) {
			var angle_ = image_angle + (i * gun.spread_angle) - ((gun.spread_number - 1) * (gun.spread_angle / 2));
			
			instance_create_depth(x,y,depth-1,obj_projectile,{
				image_angle: angle_ + random_range(-gun.inaccuracy,gun.inaccuracy),
				sprite_index: gun.ammo[bullet_index].sprite,
				spd: gun.ammo[bullet_index].spd,
				destroy_on_impact: gun.ammo[bullet_index].destroy_on_impact
			});
		}
		
		//Gun kick and knockback
		//x -= gun.kick * image_yscale;
		//knockback_angle += gun.kick * image_yscale;
		if (gun.reset_momentum) {
			speed = 0;
		}
		motion_add(image_angle, obj_player.vsp_basicjump * gun.momentum_added);
		if (speed > gun.max_speed and gun.full_auto = true) { //player cant exceed certain speed if full_auto = true
			
			speed = gun.max_speed;
		}
		
		//iterate through ammo types
		if (bullet_index < array_length(gun.ammo) - 1) {
			bullet_index += 1;
		}else {
			bullet_index = 0;
		}
		
		
	}
}