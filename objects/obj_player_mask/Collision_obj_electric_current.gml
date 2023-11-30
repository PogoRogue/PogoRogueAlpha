/// @description Get damaged

if(other.power_on && parent_index.current_iframes <= 0) {
	scr_Player_Damaged(other.damage);
}
