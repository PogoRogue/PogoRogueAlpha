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
	if gun.current_bullets != gun.bullets_per_bounce { //reload bullets
		//reload sound
		audio_play_sound(snd_reload,0,false);
		gun.current_bullets = gun.bullets_per_bounce; 
	}
	state = state_free;
	charge = 0;
	bouncing = false;
	
	if pickups_array[0].reload_on_bounce = true {
		pickups_array[0].uses_per_bounce = pickups_array[0].max_uses_per_bounce;
		pickups_array[0].on_cooldown = false;
	}
	if pickups_array[1].reload_on_bounce = true {
		pickups_array[1].uses_per_bounce = pickups_array[1].max_uses_per_bounce;
		pickups_array[1].on_cooldown = false;
	}
	
	//flames
	allow_flames = false;
	min_flames_speed = 5.6;
}