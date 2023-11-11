/// @description On destroy

//create bubble pop
if (gun_name = "Bubble Gun") {
	instance_create_depth(x,y,depth,obj_projectile_bubble_pop);
}

//create explosion
if (gun_name = "Grenade Launcher") {
	instance_create_depth(x,y,depth,obj_projectile_explosion);
}