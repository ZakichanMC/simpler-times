if array_length(oTimer.timersList) > 0 {
	currentTimer = oTimer.timersList[array_length(oTimer.timersList)-1].type;
}

if currentTimer == twelfthsec numFrames = 5;
else if currentTimer == quartsec numFrames = 15;
else if currentTimer == halfsec numFrames = 30;
else if currentTimer == sec numFrames = 60;

if x == leftmost dir = 4;
else if x == rightmost dir = -4;

vx = (60 div numFrames) * dir;
x += vx;

if global.palette == sCyberPalette sprite_index = sCyberMoving;
else if global.palette == sSteampunkPalette sprite_index = sSteampunkMoving;
else if global.palette == sCavemanPalette sprite_index = sCavemanMoving;