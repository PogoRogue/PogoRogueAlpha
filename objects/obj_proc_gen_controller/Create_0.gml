gen_next_block = true;
randomize();
block_to_create = choose(spr_u1);
x_offset = 0;
y_offset = 1000;

global.BLOCK_SIZE = 64; //The size of the proc gen blocks. This is the size all
//proc gen sprites need to be. Don't change this number unless you change every proc gen sprite

scr_Generate_Level_Layout();



