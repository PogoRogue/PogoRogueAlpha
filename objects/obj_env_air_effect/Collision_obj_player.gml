/// @description Change velocity of player
affect_hspeed = cos(image_angle * pi / 180);
affect_vspeed = -sin(image_angle * pi / 180);

if(power_weakens_on_distance)
{
other.hspeed += air_strength * affect_hspeed * (point_direction(x,y,other.x,other.y)/sprite_width);
other.vspeed += air_strength * affect_vspeed * (point_direction(x,y,other.x,other.y)/sprite_width);
}
else
{
other.hspeed += air_strength * affect_hspeed;
other.vspeed += air_strength * affect_vspeed;
}





