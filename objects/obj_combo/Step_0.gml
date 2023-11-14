if global.combo_length > 0
{
	if global.combo > 1
	{
		global.combo_length -= combo_decrease_speed;
	}else
	{
		global.combo_length = 0;
	}
}else
{
	global.combo = 1;
}