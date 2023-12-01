event_inherited(); 

list_of_possible_weapons = [obj_item_weapon_default,obj_item_weapon_paintball,obj_item_weapon_shotgun,obj_item_weapon_bubble,obj_item_weapon_burstfire,obj_item_weapon_grenade,obj_item_weapon_laser];
random_weapon_drop = list_of_possible_weapons[irandom_range(0,array_length(list_of_possible_weapons)-1)];
with instance_create_depth(x,y,depth,random_weapon_drop) {
	follow_player = true;
}

weapon = obj_player.default_gun;
item_name = "";
item_description = "";

instance_destroy();