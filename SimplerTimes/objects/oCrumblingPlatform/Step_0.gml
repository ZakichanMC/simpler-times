if array_length(oTimer.timersList) > 0 {
	currentTimer = oTimer.timersList[array_length(oTimer.timersList)-1].type;
}

if not crumbling {
	respawnTimer = 60;
	image_index = 0;
	if currentTimer == twelfthsec numFrames = 5;
	else if currentTimer == quartsec numFrames = 15;
	else if currentTimer == halfsec numFrames = 30;
	else if currentTimer == sec numFrames = 60; //change this later
}
else { // once we start standing on it, tick down
	image_index = irandom(8);
	numFrames--;
}

// when we've ran out of time to stand
if numFrames <= 0 {
	x = origX;
	y = origY;
	collidable = false;
	respawnTimer--;
}

if respawnTimer <= 0 {
	collidable = true;
	crumbling = false;
}

if global.palette == sCyberPalette sprite_index = sCyberCrumblingNew;
else if global.palette == sSteampunkPalette sprite_index = sSteampunkCrumblingNew;
else if global.palette == sCavemanPalette sprite_index = sCavemanCrumblingNew;
