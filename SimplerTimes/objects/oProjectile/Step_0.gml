x -= spd;
if x <= destination instance_destroy();

if global.palette == sCyberPalette sprite_index = sCyberProjectile;
else if global.palette == sSteampunkPalette sprite_index = sSteampunkProjectile;
else if global.palette == sCavemanPalette sprite_index = sCavemanProjectile;