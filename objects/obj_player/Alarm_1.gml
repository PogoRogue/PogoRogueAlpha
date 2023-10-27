if (buff_active) {
    // Buff的持续时间已经结束，取消变化
    speed -= 3;
    current_weapon[0] = current_weapon[0] - 4; 
	projectiles_left = current_weapon[0];
    buff_active = false; // 设置Buff为非活动
}






