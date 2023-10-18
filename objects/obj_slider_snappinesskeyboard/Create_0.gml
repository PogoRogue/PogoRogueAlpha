/// @description Initialize variables

// Inherit the parent event
event_inherited();

custom_min_value = 1
custom_max_value = 5
default_value = abs(obj_player.rotation_delay)*10
custom_value = default_value
str = "Snappiness"

value = (default_value-custom_min_value)/(custom_max_value-custom_min_value)
custom_increment = 0.25

increment = 1 / ((custom_max_value-custom_min_value) / custom_increment)