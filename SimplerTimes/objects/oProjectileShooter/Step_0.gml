if array_length(oTimer.timersList) > 0 {
	currentTimer = oTimer.timersList[array_length(oTimer.timersList)-1].type;
}

if currentTimer == twelfthsec numFrames = 5;
else if currentTimer == quartsec numFrames = 15;
else if currentTimer == halfsec numFrames = 30;
else if currentTimer == sec numFrames = 60; //change this later

if oTimeFill.timeFrames mod numFrames == 0 {
	var _proj = instance_create_layer(x+8,y+7,"Instances",oProjectile);
	_proj.depth = depth+1;
}

if global.palette == sCyberPalette sprite_index = sCyberProjectileShooter;
else if global.palette == sSteampunkPalette sprite_index = sSteampunkProjectileShooter;
else if global.palette == sCavemanPalette sprite_index = sCavemanProjectileShooter;