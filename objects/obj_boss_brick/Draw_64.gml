/// @description Draw health bar

if(draw_hp) 
{
	var _cam_x = camera_get_view_x(view_camera[0]);
	var _cam_y = camera_get_view_y(view_camera[0]);
	depth -= 100;
	hp_percent = (hp / hp_max) * 100;
	draw_healthbar(x - _cam_x - 32, y - _cam_y - sprite_height, x - _cam_x + 32, y - _cam_y - sprite_height + 1, hp_percent, #212123, #B45252, #B45252, 0, true, true);
	depth += 100;
}

