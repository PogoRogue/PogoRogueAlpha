follow_player = true;
pickup = obj_player.pickup_slowmo;
item_name = "Slow Mo";
cooldown_text = "\n\n Cooldown: " + string(pickup.max_cooldown_time / 60) + " seconds";
item_description = "Slows down time temporarily." + cooldown_text;
item_cost = 65;