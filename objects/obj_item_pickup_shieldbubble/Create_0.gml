follow_player = true;
pickup = obj_player.pickup_shieldbubble;
item_name = "Shield Bubble";
cooldown_text = "\n\n Cooldown: " + string(pickup.max_cooldown_time / 60) + " seconds";
item_description = "Creates a shield around the player. Lasts for 5 seconds or until it is destroyed." + cooldown_text;
item_cost = 55;