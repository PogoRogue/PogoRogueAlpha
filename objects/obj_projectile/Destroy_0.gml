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