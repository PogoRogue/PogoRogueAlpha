// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Laser_Sight(){
	//draw laser sight
	draw_set_alpha(0.6);
	if laser_sight = true {
		draw_line_width_color(x-1,y-1,x-1+lengthdir_x(1000,angle-90),y-1+lengthdir_y(1000,angle-90),1.25,make_color_rgb(180,82,82),make_color_rgb(180,82,82));
	}
	draw_set_alpha(1);
}