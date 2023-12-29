center_x = camera_get_view_width(view_camera[0])/2;

//darken screen
draw_set_color(make_color_rgb(33,33,35));
draw_set_alpha(0.75);
draw_rectangle(0,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),false);
draw_set_alpha(1);

//draw UI
if select_y = 0 {
	draw_sprite(spr_itemmenu_passives,select = 1,center_x-96,72);
	draw_sprite(spr_itemmenu_actives,select = 2,center_x,72);
	draw_sprite(spr_itemmenu_weapons,select = 3,center_x+96,72);
}else {
	draw_sprite(spr_itemmenu_passives,(select = 1)*2,center_x-96,72);
	draw_sprite(spr_itemmenu_actives,(select = 2)*2,center_x,72);
	draw_sprite(spr_itemmenu_weapons,(select = 3)*2,center_x+96,72);
}

//PASSIVES
if select = 1 {
	var item_selected = ((select_y-1)*4)+select_x;
	//grid
	for(xx = 0; xx < select_x_max; xx++) {
		for(yy = 0; yy < select_y_max; yy++) {
			draw_sprite(spr_item_slot_shop,(select_x-1 = xx and select_y-1 = yy),center_x-84+xx*56,128+yy*56);
		}
	}
	
	//item sprites
	for (i = 0; i < array_length(global.all_buff_sprites); i++) {
		var xx = (center_x - 84) + (i % 4) * 56;
		var yy = 128 + floor(i / 4) * 56;
		draw_sprite(global.all_buff_sprites[i],global.all_buff_sprites_index[i]+1,xx,yy);
	
		//numbers of each buff
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_itemdescription2);
		if global.all_buff_numbers[i] > 1 {
			scr_Draw_Text_Outlined(xx-8,yy+8,global.all_buff_numbers[i],c_white);
		}
		
		//draw item description
		if i = item_selected-1 {
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_set_font(fnt_combo2);
			var bubble_x = center_x-196;
			if select_x <= 2 {
				bubble_x = center_x-196;
			}else {
				var bubble_x = center_x+196;
			}
			draw_sprite(spr_itemmenu_passive_slot,0,bubble_x,yy);
			draw_sprite(global.all_buff_sprites[i],global.all_buff_sprites_index[i]+1,bubble_x-37,yy-25);
			
			//name
			scr_Draw_Text_Outlined(bubble_x+16,yy-25,scr_Linebreak(global.all_buff_names[i],12,99),c_white);
			
			//description
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_set_font(fnt_itemdescription2);
			scr_Draw_Text_Outlined(bubble_x-48,yy-8,scr_Linebreak(global.all_buff_descriptions[i],21,99),c_white);
			
			//stackability
			draw_set_halign(fa_center);
			scr_Draw_Text_Outlined(bubble_x,yy+36,scr_Linebreak(global.all_buff_stats[i],21,99),c_white);
		}
	}
}