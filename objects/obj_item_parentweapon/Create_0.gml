event_inherited(); 
follow_player = false;

list_of_possible_weapons = [obj_item_weapon_default,obj_item_weapon_paintball,obj_item_weapon_shotgun,
							obj_item_weapon_bubble,obj_item_weapon_burstfire,obj_item_weapon_grenade,
							obj_item_weapon_laser, obj_item_weapon_bouncyball,obj_item_weapon_missile];
random_weapon_drop = list_of_possible_weapons[irandom_range(0,array_length(list_of_possible_weapons)-1)];

weapon = obj_player.default_gun;
item_name = "";
item_description = "";