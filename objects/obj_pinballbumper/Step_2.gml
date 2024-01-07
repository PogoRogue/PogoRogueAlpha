//mask index
if activated = true {
	mask_index = spr_nothing;	
}else {
	sprite_index = spr_pinballbumper;
	image_index = 0;
	image_speed = 0;
	mask_index = sprite_index;	
}

//collision
with obj_player {
	if place_meeting(x+hspeed,y+vspeed,other) and other.activated = false {
		scr_Screen_Shake(4,8);
		audio_play_sound(snd_pinball,0,false);
		other.activated = true;
		other.sprite_index = spr_pinballbumper_activated;
		other.image_speed = 1;
		speed = 10;
		direction = point_direction(other.x,other.y,x + lengthdir_x(22,angle+90),y + lengthdir_y(22,angle+90));
		state = state_free;
	}
}

if sprite_index = spr_pinballbumper_activated and scr_Animation_Complete() {
	activated = false;
}