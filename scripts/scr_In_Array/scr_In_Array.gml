function scr_In_Array(array,value) {
	ii = 0;
	
	for (i = 0; i < array_length(array); i++) {
		if array[i] = value {
			ii++;
		}
	}
	
	if ii = 0 {
		return false;
	}else {
		return true;
	}
}