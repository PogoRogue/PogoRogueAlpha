/// @description Instantiate variables

depth = -6;

grav = 0.2;

is_despawning = false;
is_touching_player = false;

wobble = 0.0;
stretch = 0.0;

alarm_set(0, 45 * room_speed); // Despawn after 60 seconds
