with obj_player_mask {
	if place_meeting(x+parent_index.hspeed,y+parent_index.vspeed,other) and other.activated = false {
		audio_play_sound(snd_pinball,0,false);
		other.activated = true;
		other.sprite_index = spr_pinballbumper_activated;
		other.image_speed = 1;
		parent_index.speed = 10;
		parent_index.direction = point_direction(other.x,other.y,parent_index.x + lengthdir_x(22,parent_index.angle+90),parent_index.y + lengthdir_y(22,parent_index.angle+90));
	}
}