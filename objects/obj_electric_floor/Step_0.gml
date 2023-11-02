/// @description Check Player Collision
if (place_meeting(x,y-1,obj_player) and power_on){
	var player_inst = instance_place(x,y-1,obj_player);
	player_inst.hp -= damage;
}
if (place_meeting(x+1,y,obj_player) and power_on){
	room_restart();
}
if (place_meeting(x-1,y,obj_player) and power_on){
	room_restart();
}
