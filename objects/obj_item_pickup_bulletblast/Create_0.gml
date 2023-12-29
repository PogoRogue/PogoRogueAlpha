follow_player = true;
pickup = obj_player.pickup_bulletblast;
item_name = "Bullet Blast";
cooldown_text = "\n\nCooldown: " + string(pickup.max_cooldown_time / 60) + " seconds";
item_description = "Creates a massive blast of bullets in all directions." + cooldown_text;
item_cost = 60;