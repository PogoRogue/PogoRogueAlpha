// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Weapon_Stats(){
	
	if weapon.full_auto = true {
		autofire = "\nAutofire: Yes";
		if weapon.ammo[0].firerate_start < 5 {
			firerate = "\nFire Rate: Very High";
		}else if weapon.ammo[0].firerate_start < 10 {
			firerate = "\nFire Rate: High";
		}else if weapon.ammo[0].firerate_start < 20 {
			firerate = "\nFire Rate: Medium";
		}else {
			firerate = "\nFire Rate: Low";
		}
	}else {
		autofire = "\nAutofire: no";	
		firerate = "";
	}
	item_stats = ("Bullets per bounce: " + 
	string(weapon.bullets_per_bounce) + 
	"\nDamage per bullet: " + string(weapon.ammo[0].damage) + 
	autofire + firerate);
	
	item_description = item_tagline + "\n\n" + item_stats;
}