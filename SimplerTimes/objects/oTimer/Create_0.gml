randomize();
global.initialSeed = random_get_seed();
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

global.roomscale = 4;
timeFrames = 0;
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