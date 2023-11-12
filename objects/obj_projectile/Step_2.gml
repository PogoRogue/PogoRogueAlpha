/// @description laser
//too many unique properties of the laser compared to other projectiles so I had to make a separate event
if (gun_name = "Laser Gun") {
	
	image_angle = obj_player.image_angle-90;
	x = obj_player.x +laser_x;
	y = obj_player.y +laser_y;
	
	//change sprite after animation complete
	if (floor(image_index) = sprite_get_number(sprite_index)-1) {
		sprite_index = full_sprite;
		mask_index = sprite_index;
		laser_boost = true;
	}
	
	//retract laser
	if (floor(image_index) = 0 and image_speed = -1) {
		instance_destroy();
	}
	
	with obj_player {
		
		//check if speed slower or faster than max speed to preserve momentum
		if (abs(speed) > gun.max_speed and vspeed < 0) {
			slower_than_max = false;
			current_max = speed;
		}else {
			slower_than_max = true;	
			current_max = 0;
		}
		
		//reset/preserve momentum
		if (gun.reset_momentum and slower_than_max) {
			speed = 0;
		}else if (gun.reset_momentum) {
			speed = current_max + (vsp_basicjump*gun.momentum_added);	
		}
		
		//add momentum
		if (other.laser_boost) {
			motion_add(angle - 90, vsp_basicjump * gun.momentum_added);
		}
		
		//set max speed for auto weapons
		if (speed > gun.max_speed) { //player cant exceed certain speed if full_auto = true
			speed = max(gun.max_speed, current_max);
		}
		
		//decrease ammo
		if (gun.spread_number = 1 and other.laser_boost) {
			gun.current_bullets -= 1;
		}
		
		//screen shake
		if (other.laser_boost){
			scr_Screen_Shake(2,1);
			gamepad_set_vibration(0, 0.25, 0.25);
			rotation_speed = other.rotation_speed * 0.75;
			rotation_delay = rotation_speed / 7;
		}
		
		//retract laser if not firing
		if !(key_fire_projectile) {
			scr_Retract_Laser();
			other.laser_boost = false;
		}
		
		//retract if out of ammo
		if (gun.current_bullets = 0) {
			scr_Retract_Laser();
			other.laser_boost = false;
		}
		
		//delete if not free
		if (state != state_free) {
			scr_Retract_Laser();
			other.laser_boost = false;
		}
	}
}