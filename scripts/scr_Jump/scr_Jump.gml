// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Jump(add_to_jump){
	speed = vsp_basicjump+add_to_jump; //bounce speed
	direction = angle - 90; //bounce angle
	hspeed += conveyor_speed;
	conveyor_speed = 0;
	sprite_index = player_sprite;
	image_speed = 0;
	image_index = 0; //reset animation to starting frame
	animation_complete = false;
	gun.current_bullets = gun.bullets_per_bounce; //reload bullets
	state = state_free;
	charge = 0;
}