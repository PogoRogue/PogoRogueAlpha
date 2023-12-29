if room = room_shop {

var xx = 0;
var yy = 0;

for(i = 0; i < num_of_slots; i++) {
	if i % 2 = 0 {
		xx = 272;
	}else {
		xx = 336;
	}
	yy = 104 + 64 * floor(i / 2);
	
	if refresh_button = false {
		draw_sprite(spr_item_slot_shop,i=select-1,xx,yy);
	}else {
		draw_sprite(spr_item_slot_shop,0,xx,yy);
	}
	
	//draw cost
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_uifontsmall);
	
	if instance_exists(slot_items_array[i]) {
		scr_Draw_Text_Outlined(xx-6,yy+21,slot_items_array[i].item_cost,c_white);
		draw_sprite(spr_coin,0,xx+10,yy+21);
		
		//sold out
		if slot_items_array[i].sold_out = true {
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_set_font(fnt_uifontsmall);
			scr_Draw_Text_Outlined(xx,yy-21,"Sold Out",make_color_rgb(180,82,82));
		}
	}	
	
	
}
xx = 304;
xx2 = 376;
yy = 104;
yy2 = 336;
draw_set_font(fnt_uifont2small);
draw_sprite(spr_item_slot_refresh,refresh_button + (((global.num_of_coins < refresh_cost or refreshes_left <= 0)*refresh_button)),xx,yy2);
draw_text(xx,yy2,"REFRESH");
if refreshes_left > 0 {
	draw_set_font(fnt_uifontsmall);
	scr_Draw_Text_Outlined(xx-6,yy2+9,refresh_cost,c_white);
	draw_sprite(spr_coin,0,xx+10,yy2+9);
}
draw_set_font(fnt_uifont2small);
if refreshes_left > 1 or refreshes_left <= 0 {
	scr_Draw_Text_Outlined(xx,yy2+22,string(refreshes_left) + " REFRESHES LEFT",c_white);
}else {
	scr_Draw_Text_Outlined(xx,yy2+22,string(refreshes_left) + " REFRESH LEFT",c_white);
}

draw_sprite(spr_item_slot_name,0,xx2,yy);
draw_sprite(spr_item_slot_description,0,xx2,yy + 64);
draw_sprite(spr_item_slot_buy,(select = 0) + (too_expensive and select = 0 or sold_out and select = 0),xx2+96,yy + 192);

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_item_popup);
draw_text(xx2+96,yy,item_name);

draw_set_font(fnt_combo2);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(xx2+12,yy + 56,scr_Linebreak(item_description,28,99));
}