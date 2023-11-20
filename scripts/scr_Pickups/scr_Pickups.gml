// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Pickups(){
	
	pickup_nothing = {
		name: "",                               //name of the pickup
		item_description: "",                   //description of what the pickup does
		gui_sprite: spr_pickup_empty,           //pickup gui sprite
		max_cooldown_time: 0,                   //reset cooldown time to this value on every use
		cooldown_time: 0,                       //actual cooldown value that decreases over time when used
		on_cooldown: false,                     //is this pickup currently on cooldown
		states_to_call_in: [state_free],        //when this ability can be activated
		key_held: false,                        //do you need to hold the key to call this ability (true) or just press it (false)
		on_call: function() { }                 //specific actions to do when this event is called           
	};
	
	pickup_chargejump = {
		name: "Charge Jump",
		item_description: "Charge up a very powerful jump.",
		gui_sprite: spr_pickup_chargejump,
		max_cooldown_time: 300,
		cooldown_time: 300,
		on_cooldown: false,
		states_to_call_in: [state_bouncing],
		key_held: true,
		on_call: function() {
			if (obj_player.animation_complete) {
				obj_player.state = obj_player.state_chargejump;
			}
		}                  
	};
	
	pickup_groundpound = {
		name: "Ground Pound",
		item_description: "Slam to the ground with tremendous speed.",
		gui_sprite: spr_pickup_groundpound,
		max_cooldown_time: 180,
		cooldown_time: 180,
		on_cooldown: false,
		states_to_call_in: [state_free],
		key_held: false,
		on_call: function() {
			obj_player.state = obj_player.state_groundpound;
			obj_player.ground_pound_rise = true;
			obj_player.ground_pound_slam = false;
			obj_player.ground_pound_distance_risen = 0;
		}
	};
	
}