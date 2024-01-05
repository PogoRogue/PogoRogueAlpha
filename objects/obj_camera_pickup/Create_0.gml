alpha = 0.9;
decrease_alpha = false;
alarm[0] = 5;
damage = 5;

with obj_enemy_parent {
	if bbox_right > obj_camera.x - obj_camera.view_w_half and bbox_left < obj_camera.x + obj_camera.view_w_half
	and bbox_bottom > obj_camera.y - obj_camera.view_h_half and bbox_top < obj_camera.y + obj_camera.view_h_half {
		hp -= other.damage;
		if hp <= 0 {
			with obj_player {
				pickup_camera.on_cooldown = false;
				pickup_camera.cooldown_time = 0;
				scr_Reload_On_Kill();
			}
		}
	}
}