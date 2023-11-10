/// @description Raise Shield
// You can write your code in this editor

if(raise_cd == false)
{
	raise_cd = true;

	sprite_index = spr_enemy_stomp_only_Shield;
	image_index = 0;

	alarm_set(1, 40);
}