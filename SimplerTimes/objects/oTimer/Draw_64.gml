if fadeToBlack {
	draw_set_alpha(fadeOpacity);
	draw_set_color(c_black);
	draw_rectangle(0,0,1280,720,false);
}
var _timeSecsStr = string(timeSecs);
var _timeMinsStr = string(timeMins);
if string_length(_timeSecsStr) == 1 _timeSecsStr = "0"+_timeSecsStr;
if string_length(_timeMinsStr) == 1 _timeMinsStr = "0"+_timeMinsStr;
if win {
	draw_set_font(BigFont);
	draw_set_color(c_white);
	draw_sprite(sWinScreen,0,300,50);
	draw_text(250,16,"YOU WIN!!!!");
	draw_text_outlined(250,550,c_black,c_white,"Time:"+_timeMinsStr+":"+_timeSecsStr,2);
	draw_text_outlined(300,625,c_black,c_white,"Deaths:"+string(oPlayer.deathCount),2);
}
else if not fadeToBlack {
	draw_set_font(smallFont);
	draw_text_outlined(16,16,c_black,c_white,"Time:"+_timeMinsStr+":"+_timeSecsStr,2);
	draw_text_outlined(16,40,c_black,c_white,"Deaths:"+string(oPlayer.deathCount),2);
}



