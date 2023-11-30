/// @description adjust player's angle
with obj_player {
	if bouncing and place_meeting(x,y+5,other) {
		if angle < 45 {
			angle += 5;
		}
		can_rotate = false;
	}
}