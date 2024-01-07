//swing
angle_accelerration = swingspeed * dcos(angle);
     
angle_velocity += angle_accelerration;
angle += angle_velocity;

var new_x = anchor_x + lengthdir_x(distance, angle);
var new_y = anchor_y + lengthdir_y(distance, angle);

hsp = new_x - x;
vsp = new_y - y;

x += hsp;
y += vsp;

image_angle = angle + 90;