/// @description Insert description here
// You can write your code in this editor

hspeed = 0;
vspeed = 0;

var x_diff = other.x - x;

if(x_diff >= 0) {
	while(place_meeting(x, y, other)){
		other.x++;
		x--;
	}
} else {
	while(place_meeting(x, y, other)){
		other.x--;
		x++;
	}
}