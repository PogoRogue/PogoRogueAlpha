function scr_Gradually_Turn(obj_to_turn,target,turn_speed,accuracy) {
	// <obj_to_turn> takes an object
	// <target> takes an object
	// <turn_speed> takes a number
	// <accuracy> takes a number between 0 and 1
	turn_speed = turn_speed / 100000;             // Tweak the 100000 if you're not getting the desired results
	accuracy = clamp(accuracy, 0.05, 1);    // Don't want perfect accuracy or perfect inaccuracy

	// Test if parameters are valid
	if(!instance_exists(obj_to_turn)) return -1;
	if(!instance_exists(target)) return -1;

	// Reverse nomalize accuracy for calculations
	accuracy = abs(accuracy - 1.0);

	// Get the target direction and facing direction
	var target_dir = point_direction(obj_to_turn.x, obj_to_turn.y, target.x, target.y);
	var facing_dir = obj_to_turn.direction;

	// Calculate the difference between target direction and facing direction
	var facing_minus_target = facing_dir - target_dir;
	var angle_diff = facing_minus_target;
	if(abs(facing_minus_target) > 180) {
	    if(facing_dir > target_dir) {
	        angle_diff = -1 * ((360 - facing_dir) + target_dir);
	    }
	    else {
	        angle_diff = (360 - target_dir) + facing_dir;
	    }
	}

	// Gradually rotate object
	var least_accurate_aim = 10;
	if(angle_diff > least_accurate_aim * accuracy) and (abs(angle_diff) - abs(least_accurate_aim)) >= 5 {
	    obj_to_turn.image_angle -= turn_speed * delta_time;
	}
	else if(angle_diff < least_accurate_aim * accuracy) and (abs(angle_diff) - abs(least_accurate_aim)) >= 5 {
	    obj_to_turn.image_angle += turn_speed * delta_time;
	}
}