/// @description draw choice
var yy = center_y-96;
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt_combo2);
draw_set_alpha(alpha);
scr_Draw_Text_Outlined(center_x,yy-40,"Choose an item to replace:", c_white);

//adjust sprite position for pickup sprites
var x_adjust = 0;
var y_adjust = 0;

if gamepad_is_connected(0) {
	select_sprite = select_sprite_controller;
}else {
	select_sprite = select_sprite_keyboard;
}
//get current item text
draw_set_font(fnt_combo);

for(i = 0; i < num_of_slots; i++) {
	draw_sprite(spr_item_slot,i=select-1,center_x-64+(64*i),yy);
	if i = num_of_slots-1 {
		draw_sprite(spr_cancel,0,center_x-64+(64*i),yy);
	}else if i = 0 {
		draw_sprite(sprite_1,0,center_x-64+(64*i)-x_adjust,yy-y_adjust);
		scr_Draw_Text_Outlined(center_x-64+(64*i)-x_adjust,yy-16,item1_name,c_white);
	}else if i = 1 {
		draw_sprite(sprite_2,0,center_x-64+(64*i)-x_adjust,yy-y_adjust);
		scr_Draw_Text_Outlined(center_x-64+(64*i)-x_adjust,yy-16,item2_name,c_white);
	}
	
	if i = select-1 {
		draw_sprite(select_sprite,0,center_x-64+(64*i),yy+24);
	}
}

//draw new item
draw_sprite(spr_item_slot,0,center_x,yy+64);
draw_sprite(sprite_new,0,center_x-x_adjust,yy+64-y_adjust);
scr_Draw_Text_Outlined(center_x,yy+48,item_name,c_white);

draw_set_alpha(1);