/// @description Track parent's movement


// Inherit the parent event
event_inherited();

// hspeed = boss.hspeed;
// vspeed = boss.vspeed;

x = boss.x + lengthdir_x(x_off, boss.image_angle);
y = boss.y + lengthdir_y(y_off, boss.image_angle);

image_angle = boss.image_angle;