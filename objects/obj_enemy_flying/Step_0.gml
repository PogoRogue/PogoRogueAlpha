/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 

// Inherit the parent event
event_inherited();

if(is_dead) {
	spd = 0;	
} else if (place_meeting(x + speed, y, obj_ground)) {
	spd *= -1;
	image_xscale = -spd;
}

x += spd;
