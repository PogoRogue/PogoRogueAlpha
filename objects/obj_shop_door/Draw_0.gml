/// @description draw UI when colliding
draw_self();
if (colliding) {
	//check if we should draw controller UI or keyboard UI
	if gamepad_is_connected(0) {
		draw_sprite(controller_sprite,0,x,bbox_top-8);	
	}else {
		draw_sprite(keyboard_sprite,0,x,bbox_top-8);	
	}
}