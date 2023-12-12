function scr_Draw_Text_Outlined(xx,yy,str,color){
	xx = argument[0];  
	yy = argument[1];  
  
	draw_set_color(make_color_rgb(33,33,35));  
	draw_text(xx+1, yy+1, argument[2]);  
	draw_text(xx-1, yy-1, argument[2]);  
	draw_text(xx,   yy+1, argument[2]);  
	draw_text(xx+1,   yy, argument[2]);  
	draw_text(xx,   yy-1, argument[2]);  
	draw_text(xx-1,   yy, argument[2]);  
	draw_text(xx-1, yy+1, argument[2]);  
	draw_text(xx+1, yy-1, argument[2]);  
  
	draw_set_color(color);
	//set white to the white in the color pallette
	if (color = c_white) {
		draw_set_color(make_color_rgb(242,240,229));
	}
	draw_text(xx, yy, argument[2]);  
}