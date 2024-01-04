/// @description initialize variables
parent_index = instance_nearest(x,y,obj_player);
other2 = noone;
image_alpha = 1;
despawn = false;
reached_max_alpha = false;
chargejump = false;

damage = 12;

damaged_list = array_create(100, noone);
init_angle = obj_player.angle;
alarm[0] = 60;