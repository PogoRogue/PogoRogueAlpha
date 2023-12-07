/// @description Destroy
instance_destroy(self);

//create coins and items
var center_x = x - sprite_get_xoffset(sprite_index) + ((sprite_width / 2)*image_xscale);
var center_y = y - sprite_get_yoffset( sprite_index) + sprite_height / 2;
with instance_create_depth(center_x,center_y,depth-1,obj_coin_spawner) {
	num_of_coins = global.combo;
}