/// @description Check Player Collision
var damage = 8;

if (place_meeting(x,y-1,obj_player) and power_on){
	if(obj_player.current_iframes <= 0) {
		scr_Player_Damaged(damage);
	}
}
if (place_meeting(x+1,y,obj_player) and power_on){
	if(obj_player.current_iframes <= 0) {
		scr_Player_Damaged(damage);
	}
}
if (place_meeting(x-1,y,obj_player) and power_on){
	if(obj_player.current_iframes <= 0) {
		scr_Player_Damaged(damage);
	}
}
