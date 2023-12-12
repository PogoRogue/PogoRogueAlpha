/// @description increase global.num_of_coins
if room != room_shop {
	global.num_of_coins += 1;
}
audio_play_sound(snd_coin,0,false);