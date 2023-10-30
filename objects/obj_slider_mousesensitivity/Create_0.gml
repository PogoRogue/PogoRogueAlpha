/// @description Initialize variables

// Inherit the parent event
event_inherited();

custom_min_value = 300;
custom_max_value = 500;
default_value = 600 - abs(obj_player.mouse_sensitivity);
custom_value = default_value;
str = "Mouse Sensitivity";

value_ = (default_value-custom_min_value)/(custom_max_value-custom_min_value);
custom_increment = 10;

increment = 1 / ((custom_max_value-custom_min_value) / custom_increment);