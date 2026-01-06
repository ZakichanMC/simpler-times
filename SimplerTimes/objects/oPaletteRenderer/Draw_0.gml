depth = -1000;
draw_set_font(smallFont);
with oGround {
	var _w = sprite_width div 16;
	var _h = sprite_height div 16;
	for (var i=0;i<_w;i++) {
		for (var j=0;j<_h;j++) {
			draw_sprite(sCavemanPalette,tileType,x+i*16,y+j*16);
		}
	}
}