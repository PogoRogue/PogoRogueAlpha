/// @description initialize variables

//feel free to make copies of this object to mess around with movement values

grv = 0.18; //gravity
h_grv = 0.0; //horizontal drag
rotation_speed = 2.2; //rotation speed
current_rotation_speed = rotation_speed
rotation_delay = 0.25
vsp_basicjump = -6; //bounce height
angle = 0
anglemax = 40 //maximum degrees added on either side
bouncing = false; //bouncing animation when true
animation_complete = false //bounce animation before jumping
use_mouse = true //use mouse to control instead of WASD/Arrow keys?
mouse_sensitivity = 150 //the lower the value, the more sensitive the player is to mouse movement and vice versa
mouse_reanglespeed = 4 //the lower the value, the faster the player will reangle itself and vice versa
max_speed = 5 //player cant move faster than this during auto fire
invert = false

//set controls variables
key_right = 0
key_left = 0
key_fire_projectile = 0
key_right_pressed = 0
key_left_pressed = 0
key_fire_projectile_pressed = 0

//weapons

//number of bullets, momentum, auto fire, time between fires, speed, object, sprite
basic_weapon = [3,vsp_basicjump*0.9,false,5,8,obj_projectile,spr_projectile_nerfdart]
auto_weapon = [8,vsp_basicjump*0.4,true,5,8,obj_projectile,spr_projectile_paintball]
current_weapon = basic_weapon
auto_firing = current_weapon[2] //auto_fire = is the weapon an auto weapon? auto_firing = has the necessary # of frames passed to fire another auto bullet
projectiles_left = current_weapon[0] //how many projctiles left to fire

player_sprite = spr_player
falling_sprite = spr_player_falling
falling_sprite2 = spr_player_falling2

dead = false

image_speed = 0

depth = -10

//we probably want 2 separate collision masks, one for the very bottom of the pogo stick, and the other for colliding with the sides/bottom of walls
with (instance_create_depth(x,y,depth-1,obj_player_mask)) {
	parent_index = other
}
msk_index = instance_nearest(x,y,obj_player_mask) //references obj_playermask object

//item Code
has_item = false; // // Whether the player is equipped with a weapon
equipped_item = noone; // The weapon that initializes the equipment is none

