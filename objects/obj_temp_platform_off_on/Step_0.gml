/// @description update platform
if (obj_player.platform_on and sprite_index == spr_on_platform) {
	sprite_index = spr_off_platform;
} else if (!obj_player.platform_on and sprite_index == spr_off_platform) {
	sprite_index = spr_on_platform;
}
