/// @description Inherit the parent event
event_inherited();

if add_sprite_to_list = true and room != room_shop {
	with instance_create_depth(x,y,depth-1000,obj_item_text) {
		item_string = other.item_name;
	}
}