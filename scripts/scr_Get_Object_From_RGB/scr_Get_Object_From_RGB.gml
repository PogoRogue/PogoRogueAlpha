///@description Correlates an RGB to a Pogo Rogue object, returning the object index
function scr_Get_Object_From_RGB(Red, Green, Blue, Alpha){
	//Object categories:
	//Red = enemy	
	//Green = item
	//Blue = environmental hazard
	//Black/Brown = ground
	
	if(Alpha == 0) //Transparent pixel IE generate nothing!
	{
	return -1;
	}
	else if(Red > 150) //This space of colors is designated for enemies
	{
		
	}
	else if(Green > 150) //These are items!
	{
	
	}
	else if(Blue > 150) //These are environmental hazards!
	{
	
	}
	else //All other colors are ground/unassigned
	{
		if(Red < 10)
		{
			return obj_ground;
		}
		else if(Red > 10)
		{
			return obj_ground_oneway;
		}
	}
	
	//Color had no matches, generate nothing
	return -1;
	
}