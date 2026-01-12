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
	oWorldClock.image_index += 1;
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

if fadeToBlack and fadeOpacity < 1 fadeOpacity += 0.01;
if fadeOpacity >= 1 win = true;

// restart game
if keyboard_check_pressed(ord("R")) {
	holdingR = true;
}
if keyboard_check_released(ord("R")) {
	holdingR = false;
}
if holdingR {
	rFrames--;
}
else rFrames = origRFrames;

if rFrames <= 0 game_restart();