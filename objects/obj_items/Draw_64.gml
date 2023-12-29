center_x = camera_get_view_width(view_camera[0])/2;

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
		var yy = 156 + floor(i / 4) * 56;
		draw_sprite(global.all_buff_sprites[i],global.all_buff_sprites_index[i]+1,xx,yy-27);
	
		//numbers of each buff
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_itemdescription2);
		if global.all_buff_numbers[i] > 1 {
			scr_Draw_Text_Outlined(xx-8,yy-19,global.all_buff_numbers[i],c_white);
		}
		
		//draw item description
		if i = item_selected-1 {
			
			var bubble_x = center_x-181;
			if select_x <= 2 {
				bubble_x = center_x-181;
			}else {
				var bubble_x = center_x+181;
			}
			
			scr_Draw_Passive_Description(bubble_x,yy,global.all_buff_sprites[i],global.all_buff_sprites_index[i]+1,global.all_buff_names[i],global.all_buff_descriptions[i],global.all_buff_stats[i]);
		}
	}
}

//ACTIVES
if select = 2 {
	var xx1 = center_x-86;
	var xx2 = center_x+86;
	var yy = 234;
	
	scr_Draw_Pickup_Description(xx1,yy,pickup_1,1);
	scr_Draw_Pickup_Description(xx2,yy,pickup_2,2);
}

//WEAPONS
if select = 3 {
	var xx1 = center_x-86;
	var xx2 = center_x+86;
	var yy = 234;
	
	scr_Draw_Weapon_Description(xx1,yy,gun_1,1);
	scr_Draw_Weapon_Description(xx2,yy,gun_2,2);
}