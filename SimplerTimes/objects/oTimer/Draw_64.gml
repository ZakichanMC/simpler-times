var _timeSecsStr = string(timeSecs);
var _timeMinsStr = string(timeMins);
if string_length(_timeSecsStr) == 1 _timeSecsStr = "0"+_timeSecsStr;
if string_length(_timeMinsStr) == 1 _timeMinsStr = "0"+_timeMinsStr;
if win {
	draw_set_font(BigFont);
	draw_text(350,400,_timeMinsStr+":"+_timeSecsStr);
	draw_text(300,500,"Deaths: "+string(oPlayer.deathCount));
}
else {
	draw_set_font(smallFont);
	draw_text(16,16,_timeMinsStr+":"+_timeSecsStr);
	draw_text(16,32,"Deaths: "+string(oPlayer.deathCount));
}