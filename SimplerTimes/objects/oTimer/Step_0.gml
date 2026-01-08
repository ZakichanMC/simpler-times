if keyboard_check_pressed(vk_enter) and array_length(timersList) > 1 {
	show_debug_message(global.palette);
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
