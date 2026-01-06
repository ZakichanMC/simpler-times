if place_meeting(x,y,oPlayer) {
	if array_length(oTimer.timersList) > 1 {
		var _bar = oTimer.timersList[array_length(oTimer.timersList)-1];
		array_delete(oTimer.timersList,array_length(oTimer.timersList)-1,1);
		global.palette = array_shift(global.palettes);
		global.paletteGroundVariants = array_shift(global.variants);
		instance_destroy(_bar);
		oTimer.upgradesList[flagID] = true;
		instance_destroy();
	}
}