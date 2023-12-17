randomize();

room_started = false;
// Our prebuilt rooms and their dimensions
// Room format: [width, height, room_id]
prebuilt_rooms = ds_list_create();
ds_list_add(prebuilt_rooms, [3, 3, "b1"]);
//ds_list_add(prebuilt_rooms, [4, 3, "b2"]);
//ds_list_add(prebuilt_rooms, [3, 4, "b3"]);
//ds_list_add(prebuilt_rooms, [4, 4, "b4"]);


rooms_to_generate = 1;
max_gen_width = 15;

layout_grid = scr_Generate_Level_Layout(rooms_to_generate, max_gen_width, prebuilt_rooms);


//tiling layer
global.ground_layer = layer_create(-1);
global.tilemap_ground = layer_tilemap_create(global.ground_layer,-20000,-20000,tl_ground,20000,20000);
