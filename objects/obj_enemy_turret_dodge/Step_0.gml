/// @description Rotate to point to player AMD RUNAWAY

dist_to_player = distance_to_object(player);

// Check if the player is within range
if(!is_dead && dist_to_player < range) {
	// Only update if player is in the field of view as well
	can_see_player = !collision_line(x, y, player.x, player.y, obj_ground, false, true);
	if(can_see_player) {
		image_angle = point_direction(x, y, player.x, player.y);
		
		// Fire when ready
		weapon_cooldown--;
		if(weapon_cooldown <= 0) {
			//create bullet
			var _bullet = instance_create_layer(x, y, "Instances", obj_enemy_projectile_bullet);
			_bullet.direction = point_direction(x, y, player.x, player.y);
			_bullet.speed = bullet_speed;
			weapon_cooldown = cooldown_length;
		}
	}
}


// Inherit the parent event
event_inherited();

at_edge = (!collision_point(x + (sprite_width / 2), y + (sprite_height / 2), obj_ground_parent, false, false))or (!collision_point(x - (sprite_width / 2), y + (sprite_height / 2), obj_ground_parent, false, false)); 
at_wall = (collision_point(x + (sprite_width / 2), y , obj_ground_parent, false, false))or (collision_point(x - (sprite_width / 2), y , obj_ground_parent, false, false)); 
on_ground = instance_place(x,y+1,obj_ground);
chasing = false;
edge_side = 0; //left is 0,right is 1; left has wall is 2,right has wall is 3

//left edge
if(at_edge and collision_point(x + sprite_width / 2, y + (sprite_height / 2), obj_ground_parent, false, false)){
	edge_side = 0;
}	
//right edge
else if(at_edge and collision_point(x - sprite_width / 2, y + (sprite_height / 2), obj_ground_parent, false, false)){
	edge_side = 1;
}

//left has wall
else if(at_wall and collision_point(x - sprite_width / 2, y - (sprite_height / 2), obj_ground_parent, false, false)){
	edge_side = 2;
}
else if(at_wall and collision_point(x + sprite_width / 2, y - (sprite_height / 2), obj_ground_parent, false, false)){
	edge_side = 3;
}




var player_instance = instance_nearest(x, y, obj_player);
dist=player_instance.x - x;

if(at_edge or at_wall){
	spd=0;
}
	
else if(!at_edge and !at_wall){
	if(abs(dist) > 200){
			spd = 0;
	}else if(dist>0){
		
			spd=-min(3,abs(dist));
	}else{
			spd=min(3,abs(dist));
	}
	

}
hspeed=spd;