//death
if(HP == 0)
{
	instance_destroy();
}

var grounded = instance_place(x, y, [obj_ground_parent]);
if ((grounded > 0))
{
}else{
    
	vspeed = 5;
	var falling = instance_place(x, y+vspeed, [obj_ground_parent]);
	if(falling>0){
	vspeed=0
	}
}
