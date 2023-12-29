follow_player = true;
pickup = obj_player.pickup_chargejump;
item_name = "Charge Jump";
cooldown_text = "\n\nCooldown: " + string(pickup.max_cooldown_time / 60) + " seconds";
item_description = "Hold while bouncing to launch yourself to great heights." + cooldown_text;
item_cost = 60;