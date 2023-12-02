restart_button = 0;
endgame_button = 0;
scr_Generate_Layout();
//alarm[0] = 300; //set fullscreen
window_set_cursor(spr_nothing);
cursor_sprite = spr_nothing;
global.draw_collision_walls = false;
global.allow_screenshake = true;
surface_resize(application_surface,view_wport[0]*2,view_hport[0]*2);

if (instance_number(obj_control) > 1) {
	instance_destroy();
}