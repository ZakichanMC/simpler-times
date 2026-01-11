timePassed++;
y = origY + sin((timePassed/1000)*spd) * amplitude;

if place_meeting(x,y,oPlayer) {
	if array_length(oTimer.timersList) > 1 {
		var _bar = oTimer.timersList[array_length(oTimer.timersList)-1];
		array_delete(oTimer.timersList,array_length(oTimer.timersList)-1,1);
		global.palette = array_shift(global.palettes);
		global.paletteGroundVariants = array_shift(global.variants);
		global.bg = array_shift(global.bgs);
		global.parallax1 = array_shift(global.parallax1s);
		global.parallax2 = array_shift(global.parallax2s);
		global.vignette = array_shift(global.vignettes);
		oWorldClock.image_index += 1;
		instance_destroy(_bar);
		oTimer.upgradesList[flagID] = true;
		instance_destroy();
	}
}