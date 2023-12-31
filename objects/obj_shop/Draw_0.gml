if room = room_shop {

var xx = 0;
var yy = 0;

for(i = 0; i < num_of_slots; i++) {
	if i % 2 = 0 {
		xx = 304;
	}else {
		xx = 368;
	}
	yy = 120 + 64 * floor(i / 2);
	
	if refresh_button = false {
		draw_sprite(spr_item_slot_shop,i=select-1,xx,yy);
	}else {
		draw_sprite(spr_item_slot_shop,0,xx,yy);
	}
	
	//draw cost
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_combo);
	
	
	if instance_exists(slot_items_array[i]) {
		scr_Draw_Text_Outlined(xx-5,yy+21,slot_items_array[i].item_cost,c_white);
		draw_sprite(spr_coin,i=select-1,xx+6,yy+21);
		
		//sold out
		if slot_items_array[i].sold_out = true {
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_set_font(fnt_itemdescription);
			scr_Draw_Text_Outlined(xx,yy-21,"Sold Out",make_color_rgb(180,82,82));
		}
	}	
	
	
}
draw_sprite(spr_item_slot_refresh,refresh_button + ((global.num_of_coins < refresh_cost)*refresh_button),336,352);
draw_text(336,352,"Refresh");
scr_Draw_Text_Outlined(336-5,352+9,refresh_cost,c_white);
draw_sprite(spr_coin,0,336+6,352+9);

draw_sprite(spr_item_slot_name,0,408,120);
draw_sprite(spr_item_slot_description,0,408,184);
draw_sprite(spr_item_slot_buy,(select = 0) + (too_expensive and select = 0 or sold_out and select = 0),504,312);

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_combo2);
draw_text(504,120,item_name);

draw_set_font(fnt_itemdescription);
draw_set_halign(fa_left);
draw_set_valign(fa_top)
draw_text(424,176,scr_Linebreak(item_description,38,99));
}