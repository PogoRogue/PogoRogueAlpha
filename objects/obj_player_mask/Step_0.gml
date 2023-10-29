/// @description check for collisions
//collision check
if (place_meeting(x+parent_index.hspeed,y,obj_ground)) {
	while !(place_meeting(x+sign(parent_index.hspeed),y,obj_ground)) {
		parent_index.x += sign(parent_index.hspeed)
		x += sign(parent_index.hspeed)
	}
	parent_index.hspeed = 0
}


if (place_meeting(x,y+parent_index.vspeed,obj_ground) and parent_index.vspeed < 0) {
	while !(place_meeting(x,y+sign(parent_index.vspeed),obj_ground)) {
		parent_index.y += sign(parent_index.vspeed)
		y += sign(parent_index.vspeed)
	}
	parent_index.vspeed = 0
}


if (place_meeting(x+parent_index.hspeed,y,obj_electric_floor)) {
	var ground_id = instance_place(x+parent_index.hspeed,y,obj_electric_floor);
    if (ground_id.power_on){
		room_restart();
	}
	while !(place_meeting(x+sign(parent_index.hspeed),y,obj_electric_floor)) {
		parent_index.x += sign(parent_index.hspeed)
		x += sign(parent_index.hspeed)
	}
	parent_index.hspeed = 0
}


if (place_meeting(x,y+parent_index.vspeed,obj_electric_floor) and parent_index.vspeed < 0) {
	var ground_id = instance_place(x,y+parent_index.vspeed,obj_electric_floor);
    if (ground_id.power_on){
		room_restart();
	}
	while !(place_meeting(x,y+sign(parent_index.vspeed),obj_electric_floor)) {
		parent_index.y += sign(parent_index.vspeed)
		y += sign(parent_index.vspeed)
	}
	parent_index.vspeed = 0
}