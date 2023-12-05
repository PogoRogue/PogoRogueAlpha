//disable alpha blending (we just want rgb from screen)
gpu_set_blendenable(false);

if (pause) { //draw frozen image to screen while paused
	surface_set_target(application_surface);
	if surface_exists(pause_surf) {
		draw_surface(pause_surf,0,0);	
	}else { //restore from buffer if we lost the surface
		pause_surf = surface_create(res_w, res_h);
		buffer_set_surface(pause_surf_buffer,pause_surf,0);
	}
	surface_reset_target();
}

if keyboard_check_pressed(ord("P")) || gamepad_button_check_pressed(0,gp_select) || paused_outside {
	if !pause { //pause now
		pause = true;
		
		//deactivate everything other than this surface
		instance_deactivate_all(true);
		instance_activate_object(obj_control);
		instance_activate_object(obj_item_swap);
		
		//if we need to pause anything like animating sprites, tiles, room backgrounds, we need to do that separately
		
		//capture this game moment (wont capture draw gui components)
		pause_surf = surface_create(res_w,res_h);
		surface_set_target(pause_surf);
		draw_surface(application_surface,0,0);
		surface_reset_target();
		
		//back up this surface to a buffer in case we lose it
		if buffer_exists(pause_surf_buffer) {
			buffer_delete(pause_surf_buffer);	
		}
		pause_surf_buffer = buffer_create(res_w * res_h * 4, buffer_fixed, 1);
		buffer_get_surface(pause_surf_buffer, pause_surf, 0);
	}else { //unpause now
		pause = false;
		instance_activate_all();
		
		if surface_exists(pause_surf) {
			surface_free(pause_surf);
		}

		if buffer_exists(pause_surf_buffer) {
			buffer_delete(pause_surf_buffer);
		}
	}
	paused_outside = false;
}

//enable alpha blending again
gpu_set_blendenable(true);