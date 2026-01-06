if place_meeting(x,y,oPlayer) {
	if array_length(oTimer.timersList) > 1 {
		var _bar = oTimer.timersList[array_length(oTimer.timersList)-1];
		array_delete(oTimer.timersList,array_length(oTimer.timersList)-1,1);
		instance_destroy(_bar);
		oTimer.upgradesList[flagID] = true;
		instance_destroy();
	}
}