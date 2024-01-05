/// @description draw UI when colliding
draw_self();
if (colliding) {
	//check if we should draw controller UI or keyboard UI
	if gamepad_is_connected(0) 
	{
		draw_sprite(controller_sprite,0,x,bbox_top-8);	
	}
	else 
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_combo2);
		scr_Draw_Text_Outlined(x,bbox_top-8,"TAB",c_white);	
	}
}