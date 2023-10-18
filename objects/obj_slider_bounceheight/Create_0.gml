/// @description Initialize variables

// Inherit the parent event
event_inherited();

custom_min_value = 3
custom_max_value = 10
default_value = abs(obj_player.vsp_basicjump)
custom_value = default_value
str = "Bounce Height"

value = (default_value-custom_min_value)/(custom_max_value-custom_min_value)
custom_increment = 0.1

increment = 1 / ((custom_max_value-custom_min_value) / custom_increment)