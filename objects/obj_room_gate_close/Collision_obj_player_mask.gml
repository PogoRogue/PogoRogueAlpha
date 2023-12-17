/// @description Insert description here
// You can write your code in this editor

if (obj_player.enemies_killed >= obj_player.enemies_required) {
	obj_player.enemies_killed = 0;
	instance_destroy();
}
