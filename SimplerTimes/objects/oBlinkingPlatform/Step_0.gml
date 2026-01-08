collidable = false;
if array_length(oTimer.timersList) > 0 {
	currentTimer = oTimer.timersList[array_length(oTimer.timersList)-1].type;
}

if currentTimer == twelfthsec numFrames = 5;
else if currentTimer == quartsec numFrames = 15;
else if currentTimer == halfsec numFrames = 30;
else if currentTimer == sec numFrames = 60; //change this later

if oTimeFill.timeFrames < numFrames collidable = true;

if global.palette == sCyberPalette sprite_index = sCyberBlinking;
else if global.palette == sSteampunkPalette sprite_index = sSteampunkBlinking;
else if global.palette == sCavemanPalette sprite_index = sCavemanBlinking;