follow_player = true;
pickup = obj_player.pickup_reload;
item_name = "Quick Reload";
cooldown_text = "\n\nCooldown: " + string(pickup.max_cooldown_time / 60) + " seconds";
item_description = "Automatically reloads both of your weapons." + cooldown_text;
item_cost = 60;