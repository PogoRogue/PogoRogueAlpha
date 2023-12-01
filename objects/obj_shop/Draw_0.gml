var xx = 0;
var yy = 0;

for(i = 0; i < num_of_slots; i++) {
	if i % 2 = 0 {
		xx = 256;
	}else {
		xx = 320;
	}
	yy = 120 + 64 * floor(i / 2);
	draw_sprite(spr_item_slot,i=select-1,xx,yy);
}

draw_sprite(spr_item_slot_name,0,360,120);
draw_sprite(spr_item_slot_description,0,360,184);
draw_sprite(spr_item_slot_buy,0,456,312);
