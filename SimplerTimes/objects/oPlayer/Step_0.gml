leftKey = -keyboard_check(ord("A")); 
rightKey = keyboard_check(ord("D")); 
jumpKey = keyboard_check_pressed(vk_space);
if keyboard_check_pressed(ord("A")) currentDir = -1;
else if keyboard_check_pressed(ord("D")) currentDir = 1;

vx = spd * (leftKey+rightKey); 
// animation
if onGround { // on ground
	if vx == 0 {
		if currentDir == -1 sprite_index = sPlayerIdleL;
		if currentDir == 1 sprite_index = sPlayerIdleR;
	}
	else {
		if vx < 0 sprite_index = sPlayerWalkL;
		else sprite_index = sPlayerWalkR;
	}
}
else {
	if currentDir == -1 sprite_index = sPlayerJumpL;
	else if currentDir == 1 sprite_index = sPlayerJumpR;
}

if (vy < terminalVY) { //terminal velocity
	vy += grav; 
}

// coyote time
if place_meeting(x,y+1,oGround) or (place_meeting(x,y+1,oBlinkingPlatform) and oBlinkingPlatform.collidable) or place_meeting(x,y+1,oMovingPlatform) or place_meeting(x,y+1,oProjectileShooter) { //if on ground
	onGround = true;
	coyoteTime = origCoyoteTime;
}
else if place_meeting(x, y+1, oCrumblingPlatform) {
    var plat = instance_place(x, y+1, oCrumblingPlatform);
    if (plat != noone && plat.collidable) {
		onGround = true;
        coyoteTime = origCoyoteTime;
        plat.crumbling = true;
    }
}
else {
	onGround = false;
	coyoteTime--;
}
if jumpKey and coyoteTime > 0 {
	vy = -jumpHeight;
	coyoteTime = 0;
}

// horiz collision
if (vx != 0 && place_meeting(x+vx, y, oGround)) {
    repeat (abs(vx) + 1) {
	    if (!place_meeting(x+sign(vx), y, oGround)) {
	        x += sign(vx);
	    } else break;
	}
    vx = 0;
}
if (vx != 0 && place_meeting(x+vx, y, oBlinkingPlatform) and oBlinkingPlatform.collidable) {
    repeat (abs(vx) + 1) {
	    if (!place_meeting(x+sign(vx), y, oBlinkingPlatform)) {
	        x += sign(vx);
	    } else break;
	}
    vx = 0;
}
if (vx != 0 && place_meeting(x+vx, y, oCrumblingPlatform) and oCrumblingPlatform.collidable) {
    repeat (abs(vx) + 1) {
	    if (!place_meeting(x+sign(vx), y, oCrumblingPlatform)) {
	        x += sign(vx);
	    } else break;
	}
    vx = 0;
}
if (vx != 0 && place_meeting(x+vx, y, oMovingPlatform)) {
    repeat (abs(vx) + 1) {
	    if (!place_meeting(x+sign(vx), y, oMovingPlatform)) {
	        x += sign(vx);
	    } else break;
	}
    vx = 0;
}

if (vx != 0 && place_meeting(x+vx, y, oProjectileShooter)) {
	repeat (abs(vx) + 1) {
	    if (!place_meeting(x+sign(vx), y, oMovingPlatform)) {
	        x += sign(vx);
	    } else break;
	}
	vx = 0;
}

// vert collision
if vy != 0 and place_meeting(x,y+vy,oGround) { 
	repeat (abs(vy) + 1) {
	    if (!place_meeting(x,y+sign(vy), oGround)) {
	        y += sign(vy);
	    } else break;
	}
	vy = 0; 
} 
if vy != 0 and place_meeting(x,y+vy,oBlinkingPlatform) and oBlinkingPlatform.collidable { 
	repeat (abs(vy) + 1) {
	    if (!place_meeting(x,y+sign(vy), oBlinkingPlatform)) {
	        y += sign(vy);
	    } else break;
	}
	vy = 0; 
} 
if vy != 0 place_meeting(x, y+vy, oCrumblingPlatform) {
    var plat = instance_place(x, y+vy, oCrumblingPlatform);
    if (plat != noone && plat.collidable) {
        repeat (abs(vy) + 1) {
		    if (!place_meeting(x,y+sign(vy), plat)) {
		        y += sign(vy);
		    } else break;
		}
        vy = 0;
        plat.crumbling = true;
    }
}
if vy != 0 and place_meeting(x,y+vy,oMovingPlatform) { 
	repeat (abs(vy) + 1) {
	    if (!place_meeting(x,y+sign(vy), oMovingPlatform)) {
	        y += sign(vy);
	    } else break;
	}
	vy = 0; 
	vx += oMovingPlatform.vx;
}
if vy != 0 and place_meeting(x,y+vy,oProjectileShooter) { 
	repeat (abs(vy) + 1) {
	    if (!place_meeting(x,y+sign(vy), oProjectileShooter)) {
	        y += sign(vy);
	    } else break;
	}
	vy = 0; 
} 

// STUPID HENRY FIX FOR GETTING STUCK IN BLOCK
if (is_solid_at(x, y))
{
	var hx = 9999;
	var vyu = 9999;
	var maxd = 32;

	// left
	for (var d = 1; d <= maxd; d++)
	{
		if (!is_solid_at(x - d, y)) { hx = -d; break; }
	}

	// right
	for (var d = 1; d <= maxd; d++)
	{
		if (!is_solid_at(x + d, y))
		{
			if (abs(d) < abs(hx)) hx = d;
			break;
		}
	}

	// up
	for (var d = 1; d <= maxd; d++)
	{
		if (!is_solid_at(x, y - d)) { vyu = -d; break; }
	}

	// down
	for (var d = 1; d <= maxd; d++)
	{
		if (!is_solid_at(x, y + d))
		{
			if (abs(d) < abs(vyu)) vyu = d;
			break;
		}
	}

	// snap shortest
	if (abs(hx) < abs(vyu))
	{
		x += hx;
		vx = 0;
	}
	else
	{
		y += vyu;
		vy = 0;
	}
}

x += vx;
y += vy;

// projectile hit detection
//sprite_index = sPlayer;
if place_meeting(x,y,oProjectile) {
	x = 32;
	y = 224;
}

// room transitions
if place_meeting(x,y,oRoomTransition12) {
	room_goto(Room2);
	x = 624;
	y = 256;
}
else if place_meeting(x,y,oRoomTransition21) {
	room_goto(Room1);
	x = 0;
	y = 256;
}
else if place_meeting(x,y,oRoomTransition23) {
	room_goto(Room3);
	y = -16;
}
else if place_meeting(x,y,oRoomTransition32) {
	room_goto(Room2);
	y = 256;
}
else if place_meeting(x,y,oRoomTransition34) {
	room_goto(Room4);
	y = 0;
}
else if place_meeting(x,y,oRoomTransition43) {
	room_goto(Room3);
	x = 480;
	y = 240;
}

//placeholder high jump
if keyboard_check_pressed(ord("V")) vy -= 15;
//spikes collision
if place_meeting(x,y,oSpikes) {
	deathCount++;
	x = respawnX;
	y = respawnY;
}