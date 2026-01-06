if array_length(oTimer.timersList) > 0 {
	currentTimer = oTimer.timersList[array_length(oTimer.timersList)-1].type;
}

if not crumbling {
	if currentTimer == twelfthsec numFrames = 5;
	else if currentTimer == quartsec numFrames = 15;
	else if currentTimer == halfsec numFrames = 30;
	else if currentTimer == sec numFrames = 60; //change this later
}
else {
	numFrames--;
}

if numFrames = 0 {
	collidable = false;
	crumbling = false;
}
else if oTimeFill.timeFrames == 0 collidable = true;