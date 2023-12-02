if (follow_player = true) {
	move_towards_point(obj_player.x,obj_player.y,speed);
	speed = lerp(speed,8,0.05);	
}