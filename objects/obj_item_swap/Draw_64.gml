/// @description draw choice
var yy = center_y-108;
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt_item_popup);
draw_set_alpha(alpha);
scr_Draw_Text_Outlined(center_x,yy-44,"Choose an item to replace:", c_white);


//adjust sprite position for pickup sprites
var x_adjust = 0;
var y_adjust = 0;

if global.use_controller = true {
	select_sprite = select_sprite_controller;
}else {
	select_sprite = select_sprite_keyboard;
}
//get current item text
draw_set_font(fnt_itemdescription2);

for(i = 0; i < num_of_slots; i++) {
	if num_of_slots = 3 {
		draw_sprite(spr_item_slot,i=select-1,center_x-64+(64*i),yy);
	}else if num_of_slots = 4 {
		draw_sprite(spr_item_slot,i=select-1,center_x-96+(64*i),yy);
	}
	if i = num_of_slots-1 {
		if num_of_slots = 3 {
			draw_sprite(spr_cancel,0,center_x-64+(64*i),yy);
		}else if num_of_slots = 4 {
			draw_sprite(spr_cancel,0,center_x-96+(64*i),yy);
		}
	}else if i = 0 {
		if num_of_slots = 3 {
			draw_set_valign(fa_center);
			draw_sprite(sprite_1,0,center_x-64+(64*i)-x_adjust,yy-y_adjust);
			scr_Draw_Text_Outlined(center_x-64+(64*i)-x_adjust,yy-21,scr_Linebreak(item1_name,12,99),c_white);
		}else if num_of_slots = 4 {
			draw_set_valign(fa_center);
			draw_sprite(sprite_1,0,center_x-96+(64*i)-x_adjust,yy-y_adjust);
			scr_Draw_Text_Outlined(center_x-96+(64*i)-x_adjust,yy-21,scr_Linebreak(item1_name,12,99),c_white);
		}
	}else if i = 1 {
		if num_of_slots = 3 {
			draw_set_valign(fa_center);
			draw_sprite(sprite_2,0,center_x-64+(64*i)-x_adjust,yy-y_adjust);
			scr_Draw_Text_Outlined(center_x-64+(64*i)-x_adjust,yy-21,scr_Linebreak(item2_name,12,99),c_white);
		}else if num_of_slots = 4 {
			draw_set_valign(fa_center);
			draw_sprite(sprite_2,0,center_x-96+(64*i)-x_adjust,yy-y_adjust);
			scr_Draw_Text_Outlined(center_x-96+(64*i)-x_adjust,yy-21,scr_Linebreak(item2_name,12,99),c_white);
		}
	}else if i = 2 and num_of_slots > 3 {
		draw_set_valign(fa_center);
		draw_sprite(sprite_3,0,center_x-96+(64*i)-x_adjust,yy-y_adjust);
		scr_Draw_Text_Outlined(center_x-96+(64*i)-x_adjust,yy-21,scr_Linebreak(item3_name,12,99),c_white);
	}
	
	if global.use_controller = true {
		if i = select-1 {
			if num_of_slots = 3 {
				draw_sprite(select_sprite,0,center_x-64+(64*i),yy+24);
			}else if num_of_slots = 4 {
				draw_sprite(select_sprite,0,center_x-96+(64*i),yy+24);
			}
		}
	}else {
		if i = select-1 {
			draw_set_font(fnt_combo2);
			if num_of_slots = 3 {
				scr_Draw_Text_Outlined(center_x-64+(64*i),yy+21,"E",c_white);
			}else if num_of_slots = 4 {
				scr_Draw_Text_Outlined(center_x-96+(64*i),yy+21,"E",c_white);
			}
			draw_set_font(fnt_itemdescription2);
		}
	}
	
}

//draw new item
if pickups_mode = true {
	num_of_slots = 3;
	scr_Draw_Pickup_Description(center_x,yy+178,new_item,0);
	draw_set_font(fnt_item_popup);
}else if weapons_mode = true {
	scr_Draw_Weapon_Description(center_x,yy+178,new_item,0);
	draw_set_font(fnt_item_popup);
}
/*
draw_sprite(spr_item_slot,0,center_x,yy+64);
draw_sprite(sprite_new,0,center_x-x_adjust,yy+64-y_adjust);
scr_Draw_Text_Outlined(center_x,yy+43,scr_Linebreak(item_name,12,99),c_white);*/

draw_set_alpha(1);