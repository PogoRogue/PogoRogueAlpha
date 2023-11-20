if (buff_active) {
    // if buff duration = 0 then cancel buff
    speed -= 3;
    current_weapon[0] = current_weapon[0] - 4; 
	projectiles_left = current_weapon[0];
    buff_active = false; // sett buff active to false
}