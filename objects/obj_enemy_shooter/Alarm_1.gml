/// @description Fire projectile


instance_create_layer(x, y, "Instances", obj_enemy_projectile);
alarm_set(1, 3 * room_speed)


