/// @description Initialize variables
event_inherited();
//Initialize these to the inner door position. These variables will be set when a door outside the 
//shop is used so this door knows where to teleport them
player_x_prev = x;
player_y_prev = y;

camera_x_prev = x;
camera_y_prev = y;


//Set this sprite to be the inner shop sprite
image_index = 1;