depth = -1000;
draw_set_font(smallFont);
with oGround {
	var _w = sprite_width div 16;
	var _h = sprite_height div 16;
	for (var i=0;i<_w;i++) {
		for (var j=0;j<_h;j++) {
			if tileType != tiles.blank {
				draw_sprite(global.palette,tileType,x+i*16,y+j*16);
			}
			else {
				var _seed = (x+i*16) * global.initialSeed ^ (y+j*16) * global.initialSeed;
				random_set_seed(_seed);
				var _variant = irandom_range(1,4);
				if irandom(10) != 1 _variant = 0;
				draw_sprite(global.paletteGroundVariants,_variant,x+i*16,y+j*16);
			}
		}
	}
}