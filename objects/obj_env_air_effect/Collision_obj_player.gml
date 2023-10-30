/// @description Increase hspeed of player

if(power_weakens_on_distance)
{
other.hspeed += air_strength * (point_direction(x,y,other.x,other.y)/sprite_width);
}
else
{
other.hspeed += air_strength;
}





