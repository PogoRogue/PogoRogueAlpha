/// @description Get damaged

if(!other.is_dead && parent_index.current_iframes <= 0) {
	parent_index.hp -= other.damage;
	parent_index.current_iframes = parent_index.num_iframes;
	parent_index.hspeed = -2 * sign(parent_index.hspeed);
	parent_index.vspeed = 0;
}
