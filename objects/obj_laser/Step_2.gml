/// @description follow player
image_angle = obj_player.image_angle-90;
x = obj_player.x + laser_x;
y = obj_player.y + laser_y;
x = parent_obj.x+lengthdir_x(32*i,parent_obj.image_angle);
y = parent_obj.y+lengthdir_y(32*i,parent_obj.image_angle);

//change sprite after animation complete
if (floor(image_index) = sprite_get_number(sprite_index)-1) {
	sprite_index = full_sprite;
	mask_index = sprite_index;
}

//retract laser
if (floor(image_index) = 0 and image_speed = -1) {
	instance_destroy();
}
	
with obj_player {
	
	//retract laser if not firing
	if !(key_fire_projectile) {
		scr_Retract_Laser();
	}
	
	//delete if out of ammo
	if (gun.current_bullets = 0) {
		scr_Retract_Laser();
	}
	
	//delete if not free
	if (state != state_free) {
		scr_Retract_Laser();
	}
}

//cant damage enemies if out of view
if instance_exists(obj_camera) {
	camera_width = camera_get_view_width(view_camera[0])/2;
	camera_height = camera_get_view_height(view_camera[0])/2;
	var padding = 128;

	if !(point_in_rectangle(x,y,obj_camera.x-camera_width-padding,obj_camera.y-camera_height-padding,obj_camera.x+camera_width+padding,obj_camera.y+camera_height+padding)) {
		damage = 0;
	}else {
		damage = init_damage;	
	}
}