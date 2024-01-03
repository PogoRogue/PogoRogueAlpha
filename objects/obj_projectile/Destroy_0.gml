/// @description On destroy

//create bubble pop
if (gun_name = "Bubble Gun") {
	instance_create_depth(x,y,depth,obj_projectile_bubble_pop);
	audio_play_sound(snd_bubblepop,0,false);
}

//create explosion
if (gun_name = "Grenade Launcher") or (gun_name = "Missile Launcher") {
	if instance_exists(obj_camera) {
		with instance_create_depth(x,y,depth,obj_projectile_explosion) {
			damage = other.damage;
		}
		audio_stop_sound(sound);
	}
}

//give player a boost
if (gun_name = "Star Sucker") {
	with obj_player {
		speed = 0;
		motion_add(angle - 90, vsp_basicjump*1.1);
	}
	//screen shake
	scr_Screen_Shake(5, 10)
	if (global.allow_screenshake) {
		gamepad_set_vibration(0, 1, 1);
	}
}