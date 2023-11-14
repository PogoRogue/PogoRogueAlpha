// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Retract_Laser(){
	other.image_speed = -1;
	other.mask_index = spr_nothing;
	if (other.sprite_index != other.init_sprite) {
		other.sprite_index = other.init_sprite;
		other.image_index = sprite_get_number(other.sprite_index)-3;
	}
	rotation_speed = other.rotation_speed;
	rotation_delay = rotation_speed / 7;
	angle = round(angle / other.rotation_speed)*other.rotation_speed;
}