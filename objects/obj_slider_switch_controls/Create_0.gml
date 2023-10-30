/// @description Initialize variables
// Inherit the parent event
event_inherited();

custom_value = obj_player.use_mouse;
str = "Controls";
string_false = "Keyboard";
string_true = "Mouse";


if !(disable_sliders) {
	event_user(0);
}