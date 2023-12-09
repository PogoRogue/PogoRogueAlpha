/// @description Initialize strings by column
depth += 10;

if gamepad_is_connected(0) {
	controls_left =	  "Controls:\n\n" +
					  "Rotate\n" +
					  "Shoot\n" +
					  "Switch Weapon\n" +
					  "Powerup 1\n" +
					  "Powerup 2\n" +
					  "Pause\n"
					
	controls_middle = "\n\n" +
					  "->\n" +
					  "->\n" +
					  "->\n" +
					  "->\n" +
					  "->\n" +
					  "->\n"
					
	controls_right =  "\n\n" +
					  "Left Joystick\n" +
					  "Right Trigger\n" + 
					  "Bumpers\n" +
					  "A Button\n" +
					  "B Button\n" +
					  "Start Button\n"
}else {
	controls_left =	  "Controls:\n\n" +
					  "Rotate\n" +
					  "Shoot\n" +
					  "Switch Weapon\n" +
					  "Powerup 1\n" +
					  "Powerup 2\n" +
					  "Pause\n"
					
	controls_middle = "\n\n" +
					  "->\n" +
					  "->\n" +
					  "->\n" +
					  "->\n" +
					  "->\n" +
					  "->\n"
					
	controls_right =  "\n\n" +
					  "WASD/Arrow Keys\n" +
					  "Spacebar\n" + 
					  "Q / E\n" +
					  "Shift / LMB\n" +
					  "Ctrl / RMB\n" +
					  "Escape\n"
}