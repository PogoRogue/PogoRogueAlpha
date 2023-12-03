follow_player = true;
pickup = obj_player.pickup_groundpound;
item_name = "Ground Pound";
cooldown_text = "\n\n Cooldown: " + string(pickup.max_cooldown_time / 60) + " seconds";
item_description = "Slam to the ground with massive power." + cooldown_text;
item_cost = 75;