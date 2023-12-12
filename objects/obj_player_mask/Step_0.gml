/// @description check for collisions
//bounce off
colliding_with_ground = place_meeting(x,y,obj_ground);	
colliding_with_enemies = place_meeting(x,y,obj_enemy_parent);
if place_meeting(x-4,y,obj_ground) {
	if instance_place(x-4,y,obj_ground).x < x {
		colliding_with_ground_left = true;
	}else {
		colliding_with_ground_left = false;
	}
}else {
	colliding_with_ground_left = false;	
}
if place_meeting(x+4,y,obj_ground) {
	if instance_place(x+4,y,obj_ground).x > x {
		colliding_with_ground_right = true;
	}else {
		colliding_with_ground_right = false;
	}
}else {
	colliding_with_ground_right = false;	
}

if (parent_index.state != parent_index.state_bouncing)
{

//right
if (place_meeting(x+parent_index.hspeed,y,obj_ground)) and parent_index.hspeed >= 0 {
	var _list = ds_list_create();
	var _num = instance_place_list(x+parent_index.hspeed,y,obj_ground, _list, true);
	_break = false;
	if _num > 0 {
	    for (var i = 0; i < _num; ++i;) {
			if instance_exists(_list[| i]) {
				if _list[| i].x > parent_index.x {
					with _list[| i] {
						if place_meeting(bbox_left-other.parent_index.hspeed,y,other) and other.bbox_top < bbox_bottom - 4 {
							other.parent_index.hspeed *= -0.5;
							other._break = true;
						}
					}
					if _break = true {
						break;
					}
				}
			}
	    }
	}
	
	ds_list_destroy(_list);
}

//left
if (place_meeting(x+parent_index.hspeed,y,obj_ground)) and parent_index.hspeed <= 0 {
	var _list = ds_list_create();
	var _num = instance_place_list(x+parent_index.hspeed,y,obj_ground, _list, false);
	_break2 = false;
	if _num > 0 {
	    for (var i = 0; i < _num; ++i;) {
			
			if instance_exists(_list[| i]) {
				if _list[| i].x < parent_index.x {
					with _list[| i] {
						if place_meeting(bbox_right-other.parent_index.hspeed,y,other) and other.bbox_top < bbox_bottom - 4 {
							other.parent_index.hspeed *= -0.5;
							other._break2 = true;
						}
					}
					if _break2 = true {
						break;
					}
				}
			}
	    }
	}
	
	ds_list_destroy(_list);
}

//bottom
if (place_meeting(x,y+parent_index.vspeed,obj_ground) and parent_index.vspeed < 0) {
	
	var _list = ds_list_create();
	var _num = instance_place_list(x,y+parent_index.vspeed,obj_ground, _list, false);
	_break3 = false;
	if _num > 0 {
	    for (var i = 0; i < _num; ++i;) {
			if instance_exists(_list[| i]) {
				if _list[| i].y < y {
					with _list[| i] {
						if place_meeting(x,bbox_bottom-other.parent_index.vspeed,other) and other.bbox_right > bbox_left+10 and other.bbox_left < bbox_right-10 {
							if other.parent_index.free = true {
								other.parent_index.vspeed *= -0.5;
								other._break3 = true;
							}
						}
					}
					if _break3 = true {
						break;
					}
				}
			}
	    }
	}
	
	ds_list_destroy(_list);
}

//top left corner
if (place_meeting(x,y+parent_index.vspeed,obj_walltopleftcorner) and parent_index.vspeed > 0) {
	if (hspeed > 0) {
		parent_index.hspeed *= -0.5;
	}else {
		parent_index.hspeed = -2;
	}
	
	parent_index.vspeed *= -0.5;
	
	//prevent groundpound collision glitch
	if parent_index.state = parent_index.state_groundpound {
		parent_index.state = parent_index.state_free;
	}
}


//top right corner
if (place_meeting(x,y+parent_index.vspeed,obj_walltoprightcorner) and parent_index.vspeed > 0) {
	if (hspeed < 0) {
		parent_index.hspeed *= -0.5;
	}else {
		parent_index.hspeed = 2;
	}
	parent_index.vspeed *= -0.5;
	
	//prevent groundpound collision glitch
	if parent_index.state = parent_index.state_groundpound {
		parent_index.state = parent_index.state_free;
	}
}

}