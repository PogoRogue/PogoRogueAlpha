var xx = 0;
var yy = 0;

for(i = 0; i < num_of_slots; i++) {
	if i % 2 = 0 {
		xx = 304;
	}else {
		xx = 368;
	}
	yy = 120 + 64 * floor(i / 2);
	draw_sprite(spr_item_slot_shop,i=select-1,xx,yy);
	
	//draw cost
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_combo);
	
	if instance_exists(slot_items_array[i]) {
		scr_Draw_Text_Outlined(xx-5,yy+21,slot_items_array[i].item_cost,c_white);
		draw_sprite(spr_coin,i=select-1,xx+6,yy+21);
	}
}

draw_sprite(spr_item_slot_name,0,408,120);
draw_sprite(spr_item_slot_description,0,408,184);
draw_sprite(spr_item_slot_buy,(select = 0) + (too_expensive and select = 0),504,312);

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_combo2);
draw_text(504,120,item_name);

draw_set_font(fnt_itemdescription);
draw_set_halign(fa_left);
draw_set_valign(fa_top)
draw_text(424,176,scr_Linebreak(item_description,39,99));