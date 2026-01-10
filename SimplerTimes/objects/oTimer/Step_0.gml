if keyboard_check_pressed(vk_enter) and array_length(timersList) > 1 {
	var _bar = timersList[array_length(timersList)-1];
	array_delete(timersList,array_length(timersList)-1,1);
	instance_destroy(_bar);
	global.palette = array_shift(global.palettes);
	global.paletteGroundVariants = array_shift(global.variants);
	global.bg = array_shift(global.bgs);
	global.parallax1 = array_shift(global.parallax1s);
	global.parallax2 = array_shift(global.parallax2s);
	global.vignette = array_shift(global.vignettes);
}

if not win {
	timeFrames++;
	
	if timeFrames == 60 {
		timeSecs += 1;
		timeFrames = 0;
	}
	if timeSecs == 60 {
		timeMins += 1;
		timeSecs = 0;
	}
}

// restart game
if keyboard_check_pressed(ord("R")) {
	game_restart();
}