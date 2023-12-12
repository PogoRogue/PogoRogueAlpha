/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 





// Inherit the parent event
event_inherited();

is_grounded = false;
is_jumping = false;
player = instance_nearest(x, y, obj_player);
jump_range = 150;
jump_cooldown = 0;
cooldown_length = 3 * room_speed;
jump_height = -7;

spd = 0;
at_wall = false;
