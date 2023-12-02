/// @description Check Player Collision
var damage = 8;

var player_instance = instance_nearest(x,y,obj_player);

if (place_meeting(x,y-player_instance.vspeed,obj_player) and power_on){
	if(obj_player.current_iframes <= 0) {
		scr_Player_Damaged(damage);
	}
}
if (place_meeting(x,y+player_instance.vspeed,obj_player_mask) and power_on){
	if(obj_player.current_iframes <= 0) {
		scr_Player_Damaged(damage);
	}
}
if (place_meeting(x+player_instance.hspeed,y,obj_player_mask) and power_on){
	if(obj_player.current_iframes <= 0) {
		scr_Player_Damaged(damage);
	}
}
if (place_meeting(x-player_instance.hspeed,y,obj_player_mask) and power_on){
	if(obj_player.current_iframes <= 0) {
		scr_Player_Damaged(damage);
	}
}