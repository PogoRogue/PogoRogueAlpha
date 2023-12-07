pause = false;
pause_surf = -1;
pause_surf_buffer = -1;
paused_outside = false; //when called from another object
item_swap = false;

//game resolution
res_w = camera_get_view_width(view_camera[0])*5;
res_h = camera_get_view_height(view_camera[0])*5;