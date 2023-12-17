/// @description Remove bricks

// Destroy brick attached to main body
instance_destroy(obj_boss_brick);

// Destroy all deached bricks
instance_destroy(obj_subboss_exploding);
instance_destroy(obj_subboss_fly_chasing);
instance_destroy(obj_subboss_shield);
instance_destroy(obj_subboss_tar);

instance_create_layer(x, y, "enemies", obj_explosion);

//create coins
with instance_create_depth(x,y,depth-1,obj_coin_spawner) {
	num_of_coins = 100;
}