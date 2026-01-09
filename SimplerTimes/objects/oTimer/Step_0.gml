if keyboard_check_pressed(vk_enter) and array_length(timersList) > 1 {
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

// restart game
if keyboard_check_pressed(ord("R")) {
	global.palette = sApocalypticPalette;
	global.paletteGroundVariants = sApocalypticGroundVariants;
	global.palettes = [sCyberPalette,sSteampunkPalette,sCavemanPalette];
	global.variants= [sCyberGroundVariants,sSteampunkGroundVariants,sCavemanGroundVariants];
	global.bg = sApocalypticBG;
	global.parallax1 = sApocalypticParallax1;
	global.parallax2 = sApocalypticParallax2;
	global.vignette = sApocalypticVignette;
	global.bgs = [sCyberBG,sSteampunkBG,sCavemanBG];
	global.parallax1s = [sCyberParallax1,sSteampunkParallax1,sCavemanParallax1];
	global.parallax2s = [sCyberParallax2,sSteampunkParallax2,sCavemanParallax2];
	global.vignettes = [sCyberVignette,sSteampunkVignette,sCavemanVignette];
	
	with (oUpgrade) instance_destroy();
	with (oTimeFill) instance_destroy();
	if room == Room2 or room == Room4 instance_create_layer(32,208,"Instances",oUpgrade);
	else if room == Room3 instance_create_layer(32,16,"Instances",oUpgrade);
	if instance_exists(oCrumblingPlatform) oCrumblingPlatform.sprite_index = sApocalypticCrumbling;
	if instance_exists(oMovingPlatform) oMovingPlatform.sprite_index = sApocalypticMoving;
	if instance_exists(oBlinkingPlatform) oBlinkingPlatform.sprite_index = sApocalypticBlinking;
	if instance_exists(oProjectile) oProjectile.sprite_index = sApocalypticProjectile;
	if instance_exists(oProjectileShooter) oProjectileShooter.sprite_index = sApocalypticProjectileShooter;
	// oSpikes.sprite_index = sApocalypticSpikes;
	
	var _bar1 = instance_create_layer(1152,144,"Instances",oTimeFill);
	_bar1.type = sec;
	var _bar2 = instance_create_layer(1184,144,"Instances",oTimeFill);
	_bar2.type = halfsec;
	var _bar3 = instance_create_layer(1216,144,"Instances",oTimeFill);
	_bar3.type = quartsec;
	var _bar4 = instance_create_layer(1248,144,"Instances",oTimeFill);
	_bar4.type = twelfthsec;

	timersList = [_bar1,_bar2,_bar3,_bar4];

	timerActive = twelfthsec;

	upgradesList = array_create(3,false);
}