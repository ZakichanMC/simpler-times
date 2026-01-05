/*draw_sprite_stretched(sTimeBar,0,
						x+3*barScale-sprite_get_width(sTimeBar)*barScale,
						y+3*barScale-sprite_get_height(sTimeBar)*barScale,
						sprite_get_width(sTimeBar)*barScale,
						sprite_get_height(sTimeBar)*barScale
						);*/
image_yscale = timeFrames*barScale;
image_xscale = barScale;
draw_self();