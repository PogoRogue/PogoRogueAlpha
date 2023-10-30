/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x,y-1,obj_player) and power_on){
	room_restart();
}
if (place_meeting(x+1,y,obj_player) and power_on){
	room_restart();
}
if (place_meeting(x-1,y,obj_player) and power_on){
	room_restart();
}
