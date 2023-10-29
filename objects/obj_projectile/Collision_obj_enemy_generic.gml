/// @description Damage enemy

if(!other.is_dead) {
	other.hp = 0;
	instance_destroy();
}