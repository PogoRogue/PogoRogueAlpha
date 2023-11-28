/// @description Remove bricks

// Destroy brick attached to main body
instance_destroy(obj_boss_brick);

// Destroy all deached bricks
instance_destroy(obj_subboss_exploding);
instance_destroy(obj_subboss_fly_chasing);
instance_destroy(obj_subboss_shield);
instance_destroy(obj_subboss_tar);

