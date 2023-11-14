/// @description Initialize variables

// Inherit the parent event
event_inherited();

custom_min_value = 1;
custom_max_value = 3;
default_value = (obj_player.rotation_speed);
custom_value = default_value;
str = "Rotation Speed";

value_ = (default_value-custom_min_value)/(custom_max_value-custom_min_value);
custom_increment = 0.1;

increment = 1 / ((custom_max_value-custom_min_value) / custom_increment);