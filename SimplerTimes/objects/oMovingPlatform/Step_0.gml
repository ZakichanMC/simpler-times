if array_length(oTimer.timersList) > 0 {
	currentTimer = oTimer.timersList[array_length(oTimer.timersList)-1].type;
}

if currentTimer == twelfthsec numFrames = 5;
else if currentTimer == quartsec numFrames = 15;
else if currentTimer == halfsec numFrames = 30;
else if currentTimer == sec numFrames = 60; //change this later

if x == leftmost dir = 2;
else if x == rightmost dir = -2;

vx = (60 div numFrames) * dir;
x += vx;