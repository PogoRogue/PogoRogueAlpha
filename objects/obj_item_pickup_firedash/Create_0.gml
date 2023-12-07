follow_player = true;
pickup = obj_player.pickup_firedash;
item_name = "Fire Dash";
cooldown_text = "\n\n Cooldown: " + string(pickup.max_cooldown_time / 60) + " seconds";
item_description = "Turn into a fireball and dash upwards. Cooldown resets for every dash kill you get." + cooldown_text;
item_cost = 80;