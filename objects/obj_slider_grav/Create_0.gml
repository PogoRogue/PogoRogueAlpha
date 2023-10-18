/// @description Initialize variables

// Inherit the parent event
event_inherited();

custom_min_value = 0.1
custom_max_value = 0.3
default_value = abs(obj_player.grv)
custom_value = default_value
str = "Grav"

value = (default_value-custom_min_value)/(custom_max_value-custom_min_value)
custom_increment = 0.01

increment = 1 / ((custom_max_value-custom_min_value) / custom_increment)