/// @description //destroy when animation complete
if (floor(image_index) = sprite_get_number(sprite_index)-1) {
	instance_destroy();
}

//remove collision mask after certain frame
if (floor(image_index) > 0) {
	mask_index = spr_nothing;
}