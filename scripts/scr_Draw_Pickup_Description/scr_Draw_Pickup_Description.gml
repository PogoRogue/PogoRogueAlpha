// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Draw_Pickup_Description(xx,yy,pickup,pickup_num) {
	
	//slot
	draw_sprite(spr_itemmenu_pickup_slot,0,xx,yy);
	
	//sprites
	draw_sprite(pickup.gui_sprite,1,xx-49,yy-97);
	
	//"Active" text
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_font(fnt_item_popup);
	if pickup_num = 1 {
		scr_Draw_Text_Outlined(xx,yy-128,"Active 1",c_white);
	}else if pickup_num = 2 {
		scr_Draw_Text_Outlined(xx,yy-128,"Active 2",c_white);
	}
	
	//Powerup Name
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_combo2);
	var white = make_color_rgb(242,240,229);
	draw_text_color(xx+26,yy-105,scr_Linebreak(pickup._name,16,99),white,white,white,white,1);
	
	//Powerup Description
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt_itemdescription2);
	scr_Draw_Text_Outlined(xx-72,yy-68,scr_Linebreak(pickup.tagline,28,99),c_white);
	
	//Get Powerup Stats
	var line_1 = pickup.cooldown_text; //cooldown
	
	//draw stats
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_color(xx,yy+6,line_1,white,white,white,white,1);
}