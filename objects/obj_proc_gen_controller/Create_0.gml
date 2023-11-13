gen_next_block = true;
randomize();
block_to_create = choose(spr_u1);
x_offset = 0;
y_offset = 1000;

rooms_to_generate = 3;

layoutGrid = scr_Generate_Level_Layout(rooms_to_generate);

show_debug_message("done generating layout");


