// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Draw_Weapon_Description(xx,yy,weapon,weapon_num) {
	
	//slot
	draw_sprite(spr_itemmenu_weapon_slot,0,xx,yy);
	
	//sprites
	draw_sprite(weapon.sprite,1,xx-49,yy-105);
	
	//"Weapon" text
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_font(fnt_item_popup);
	if weapon_num = 1 {
		scr_Draw_Text_Outlined(xx,yy-128,"Weapon 1",c_white);
	}else if weapon_num = 2 {
		scr_Draw_Text_Outlined(xx,yy-128,"Weapon 2",c_white);
	}else if weapon_num = 3 {
		scr_Draw_Text_Outlined(xx,yy-128,"Weapon 3",c_white);
	}
	
	//Weapon Name
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_combo2);
	var white = make_color_rgb(242,240,229);
	draw_text_color(xx+26,yy-105,scr_Linebreak(weapon._name,16,99),white,white,white,white,draw_get_alpha());
	
	//Weapon Description
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt_itemdescription2);
	draw_text_color(xx-72,yy-84,scr_Linebreak(weapon.tagline,28,99),white,white,white,white,draw_get_alpha());
	
	//Get Weapon Stats
	var line_1 = ""; //bullets per bounce
	var line_2 = ""; //damage per bullet
	var line_3 = ""; //auto fire? y/n
	var line_4 = ""; //fire rate
	var added_damage = "";
	
	line_1 = "Bullets per bounce: " + string(weapon.bullets_per_bounce) + " (Max " + string(weapon.init_bullets_per_bounce + weapon.max_added_bullets) + ")";
	
	//special conditions
	if weapon._name = "Boomerangs" {
		line_1 = "Boomerangs: " + string(weapon.bullets_per_bounce) + " (Max " + string(weapon.init_bullets_per_bounce + weapon.max_added_bullets) + ")";
	}
	
	//additional damage buff
	if global.damage_buff > 0 {
		added_damage = " + " + string(global.damage_buff);
		//special conditions
		if weapon._name = "Laser Gun" {
			added_damage = " + " + string(global.damage_buff - (global.damage_buff * 0.9));
		}
	}else {
		added_damage = "";
	}
	
	line_2 = "Damage per bullet: " + string(weapon.ammo[0].damage) + added_damage;
	
	//special conditions
	if weapon._name = "Laser Gun" {
		line_2 = "Damage per frame: " + string(weapon.ammo[0].damage) + added_damage;
	}else if weapon._name = "Boomerangs" {
		line_2 = "Damage per hit: " + string(weapon.ammo[0].damage) + added_damage;
	}
	
	if weapon.full_auto = true {
		line_3 = "Autofire: Yes";
		if weapon.ammo[0].firerate_start < 5 {
			line_4 = "Fire Rate: Very High";
		}else if weapon.ammo[0].firerate_start < 8 {
			line_4 = "Fire Rate: High";
		}else if weapon.ammo[0].firerate_start < 15 {
			line_4 = "Fire Rate: Medium";
		}else {
			line_4 = "Fire Rate: Low";
		}
	}else {
		line_3 = "Autofire: No";	
		line_4 = "Fire Rate: On Press";
	}
	
	//draw stats
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_color(xx+1,yy+6,line_1,white,white,white,white,draw_get_alpha());
	draw_text_color(xx+1,yy+30,line_2,white,white,white,white,draw_get_alpha());
	draw_text_color(xx+1,yy+54,line_3,white,white,white,white,draw_get_alpha());
	draw_text_color(xx+1,yy+78,line_4,white,white,white,white,draw_get_alpha());
}