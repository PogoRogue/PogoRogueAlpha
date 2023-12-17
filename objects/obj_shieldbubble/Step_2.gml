/// @description track player position
if instance_exists(obj_player) {
	x = obj_player.x + lengthdir_x(21,obj_player.image_angle+90);
	y = obj_player.y + lengthdir_y(21,obj_player.image_angle+90);
	image_angle = obj_player.image_angle;
}

obj_player.shield_bubble = true;

//fade out
if fade_out = true {
	image_alpha -= 0.025;
	if image_alpha <= 0 {
		instance_destroy();	
		obj_player.shield_bubble = false;
	}
}