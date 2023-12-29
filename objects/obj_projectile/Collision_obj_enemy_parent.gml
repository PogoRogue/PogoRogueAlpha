/// @description Damage enemy
var laser_damage = 0.9; //apply damage buff differently for laser
if(!other.is_dead && other.current_iframes <= 0) {
	other.hp -= (damage + global.damage_buff - (global.damage_buff * laser_damage * (gun_name = "Laser Gun" and global.damage_buff > 0))) * other.bullet_defense;
	other.red_frames = 10;
	
	scr_Reload_On_Kill();
}

if (destroy_on_impact) or (gun_name = "Missile Launcher") or (gun_name = "Bullet Blast") {
	instance_destroy();
}

colliding_with_enemy = true;