// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Draw_Tiles(xx,yy,tile_size,tileset,object){
	var left = position_meeting(xx-1,yy,object);
	var right = position_meeting(xx+tile_size+1,yy,object);
	var top = position_meeting(xx,yy-1,object);
	var bottom = position_meeting(xx,yy+tile_size+1,object);
	var top_left_corner = position_meeting(xx-1,yy-1,object);
	var top_right_corner = position_meeting(xx+tile_size+1,yy-1,object);
	var bottom_left_corner = position_meeting(xx-1,yy+tile_size+1,object);
	var bottom_right_corner = position_meeting(xx+tile_size+1,yy+tile_size+1,object);
	
	surrounded = left and right and top and bottom;
	surrounded_corners = top_left_corner and top_right_corner and bottom_left_corner and bottom_right_corner;
	
	if (surrounded) {
		tile_frame[i][j] = 34;
		draw_tile(tl_ground,34,0,xx,yy);
	}
	
	//top left
	if (!left and right and bottom and !top) {
		tile_frame[i][j] = 23;
		draw_tile(tl_ground,23,0,xx,yy);
	}
	
	//top right
	if (left and !right and bottom and !top) {
		tile_frame[i][j] = 25;
		draw_tile(tl_ground,25,0,xx,yy);
	}
	
	//bottom left
	if (!left and right and !bottom and top) {
		tile_frame[i][j] = 43;
		draw_tile(tl_ground,43,0,xx,yy);
	}
	
	//bottom right
	if (left and !right and !bottom and top) {
		tile_frame[i][j] = 45;
		draw_tile(tl_ground,45,0,xx,yy);
	}
	
	//middle left
	if (!left and right and bottom and top) {
		tile_frame[i][j] = 33;
		draw_tile(tl_ground,33,0,xx,yy);
	}
	
	//middle right
	if (left and !right and bottom and top) {
		tile_frame[i][j] = 35;
		draw_tile(tl_ground,35,0,xx,yy);
	}
	
	//middle top
	if (left and right and bottom and !top) {
		tile_frame[i][j] = 24;
		draw_tile(tl_ground,24,0,xx,yy);
	}
	
	//middle bottom
	if (left and right and !bottom and top) {
		tile_frame[i][j] = 44;
		draw_tile(tl_ground,44,0,xx,yy);
	}
	
	//corners
	if (surrounded and !top_left_corner and bottom_left_corner) {
		tile_frame[i][j] = 49;
		draw_tile(tl_ground,49,0,xx,yy);
	}
	
	if (surrounded and !top_right_corner and bottom_right_corner) {
		tile_frame[i][j] = 47;
		draw_tile(tl_ground,47,0,xx,yy);
	}
	
	if (surrounded and !bottom_left_corner) {
		tile_frame[i][j] = 29;
		draw_tile(tl_ground,29,0,xx,yy);
	}
	
	if (surrounded and !bottom_right_corner) {
		tile_frame[i][j] = 27;
		draw_tile(tl_ground,27,0,xx,yy);
	}
	
	//middle corners
	if (surrounded and !top_left_corner and !bottom_left_corner) {
		tile_frame[i][j] = 94;
		draw_tile(tl_ground,94,0,xx,yy);
	}
	
	if (surrounded and !top_right_corner and !bottom_right_corner) {
		tile_frame[i][j] = 95;
		draw_tile(tl_ground,95,0,xx,yy);
	}
}