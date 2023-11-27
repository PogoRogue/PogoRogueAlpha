path_delete(follow_path);
follow_path = path_add();

target_x = obj_player.x;
target_y = obj_player.y;

mp_grid_path(obj_SetupPathway.grid_follow,follow_path,x,y,obj_player.x,obj_player.y,true);

path_start(follow_path,1,path_action_stop,true);
//loop
alarm_set(1,60);