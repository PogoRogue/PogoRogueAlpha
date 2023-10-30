/// @description Initialize variables

// Inherit the parent event
event_inherited();

custom_min_value = 0.0;
custom_max_value = 0.4;
default_value = abs(obj_player.h_grv) * 10;
custom_value = default_value;
str = "Horizontal Drag";

value_ = (default_value-custom_min_value)/(custom_max_value-custom_min_value);
custom_increment = 0.025;

increment = 1 / ((custom_max_value-custom_min_value) / custom_increment);
more_decimals = true;
num_of_decimals = 3;