/// @description delete
if (parent_index.vspeed >= 0) or (parent_index.speed < parent_index.min_flames_speed) {
	if (reached_max_alpha = true) {
		despawn = true;
	}
}else {
	despawn = false;
}

//alpha
if (despawn = false) {
	if image_alpha < 1 {
		image_alpha += 0.1;
	}else {
		reached_max_alpha = true;	
	}
	obj_player.invincible = true;
}else if despawn = true {
	image_alpha -= 0.1;
	//destroy
	if image_alpha <= 0 {
		instance_destroy();	
		obj_player.invincible = false;
	}
}