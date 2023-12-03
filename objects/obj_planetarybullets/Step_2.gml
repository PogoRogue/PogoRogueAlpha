/// @description track player position
if instance_exists(obj_player) {
	x = obj_player.x + lengthdir_x(21,obj_player.image_angle+90);
	y = obj_player.y + lengthdir_y(21,obj_player.image_angle+90);
}