/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 





// Inherit the parent event
event_inherited();

at_edge = !collision_point(x + (sign(spd)), y + (sprite_height / 2), obj_ground_parent, false, false); 
at_wall = place_meeting(x + spd, y, obj_ground_parent);

//sprite_index = spr_enemy_moving_walk;

if (at_edge or at_wall) {
	spd *= -1;
	//sprite_index = spr_enemy_moving;
}
if (spd == 0.5) { image_xscale = 1;}
if (spd == -0.5) { image_xscale = -1;}

if(is_dead) {
	spd = 0;	
}

x += spd;
