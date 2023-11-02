/// @description Check Player Collision
var damage = 8;

if (place_meeting(x,y-1,obj_player) and power_on){
	if(obj_player.current_iframes <= 0) {
		obj_player.hp -= damage;
		obj_player.current_iframes = obj_player.num_iframes;
		obj_player.hspeed = -2 * sign(obj_player.hspeed);
		obj_player.vspeed = 0;
	}
}
if (place_meeting(x+1,y,obj_player) and power_on){
	if(obj_player.current_iframes <= 0) {
		obj_player.hp -= damage;
		obj_player.current_iframes = obj_player.num_iframes;
		obj_player.hspeed = -2 * sign(obj_player.hspeed);
		obj_player.vspeed = 0;
	}
}
if (place_meeting(x-1,y,obj_player) and power_on){
	if(obj_player.current_iframes <= 0) {
		obj_player.hp -= damage;
		obj_player.current_iframes = obj_player.num_iframes;
		obj_player.hspeed = -2 * sign(obj_player.hspeed);
		obj_player.vspeed = 0;
	}
}
