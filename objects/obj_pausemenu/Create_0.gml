if instance_number(obj_pausemenu) > 1 {
	instance_destroy();	
}

select = 1;
selected = false;
num_of_options = 5;
usable = true;
instance_deactivate_object(self);