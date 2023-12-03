restart_button = 0;
endgame_button = 0;
//alarm[0] = 300; //set fullscreen
window_set_cursor(spr_nothing);
cursor_sprite = spr_nothing;
global.draw_collision_walls = false;
global.allow_screenshake = true;
global.last_room = room;
global.player_spawn_x = 0;
global.player_spawn_y = 0;
global.player_spawn_x_prev = 0;
global.player_spawn_y_prev = 0;
global.num_of_coins = 100;

//items unlockable in the shop
global.all_buffs = [obj_item_buff_lasersight, obj_item_buff_planetarybullets];
global.all_weapons = [obj_item_weapon_default, obj_item_weapon_paintball, obj_item_weapon_shotgun, obj_item_weapon_bubble, obj_item_weapon_burstfire, obj_item_weapon_grenade, obj_item_weapon_laser];
global.all_pickups = [obj_item_pickup_chargejump, obj_item_pickup_groundpound, obj_item_pickup_hatgun, obj_item_pickup_shieldbubble, obj_item_pickup_firedash];

surface_resize(application_surface,view_wport[0]*2,view_hport[0]*2);