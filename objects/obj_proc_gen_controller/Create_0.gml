gen_next_block = true;
randomize();

// Our prebuilt rooms and their dimensions
// Room format: [width, height, room_id]
prebuilt_rooms = ds_list_create();
ds_list_add(prebuilt_rooms, [3, 3, "b1"]);
//ds_list_add(prebuilt_rooms, [4, 3, "b2"]);
//ds_list_add(prebuilt_rooms, [3, 4, "b3"]);
//ds_list_add(prebuilt_rooms, [4, 4, "b4"]);


rooms_to_generate = 3;
max_gen_width = 15;

layout_grid = scr_Generate_Level_Layout(rooms_to_generate, max_gen_width, prebuilt_rooms);



