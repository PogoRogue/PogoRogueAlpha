/// @description Player collision + button pressed

//check for player coliision
if (place_meeting(x,y,obj_player) or place_meeting(x,y,obj_player_mask)) 
{
	colliding = true;
	
}
else 
{
	colliding = false;	
}
