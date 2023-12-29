// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Draw_Passive_Description(xx,yy,item_sprite,item_image_index,item_name,item_description,item_stats) {
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_combo2);
			
	//slot
	draw_sprite(spr_itemmenu_passive_slot,0,xx,yy);
			
	//sprite
	draw_sprite(item_sprite,item_image_index,xx-42,yy-27);
			
	//name
	var white = make_color_rgb(242,240,229);
	draw_text_color(xx+15,yy-27,scr_Linebreak(item_name,12,99),white,white,white,white,1);
			
	//description
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt_itemdescription2);
	scr_Draw_Text_Outlined(xx-54,yy-8,scr_Linebreak(item_description,21,99),c_white);
			
	//stackability
	draw_set_halign(fa_center);
	scr_Draw_Text_Outlined(xx,yy+36,scr_Linebreak(item_stats,21,99),c_white);
}