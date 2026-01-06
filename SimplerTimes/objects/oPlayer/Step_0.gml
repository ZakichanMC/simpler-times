leftKey = -keyboard_check(ord("A")); 
rightKey = keyboard_check(ord("D")); 
jumpKey = keyboard_check_pressed(vk_space);

vx = spd * (leftKey+rightKey); 
if (vy < terminalVY) { //terminal velocity
	vy += grav; 
}

// coyote time
if place_meeting(x,y+1,oGround) or (place_meeting(x,y+1,oBlinkingPlatform) and oBlinkingPlatform.collidable) or place_meeting(x,y+1,oMovingPlatform) or place_meeting(x,y+1,oProjectileShooter) { //if on ground
	coyoteTime = origCoyoteTime;
}
else if place_meeting(x, y+1, oCrumblingPlatform) {
    var plat = instance_place(x, y+1, oCrumblingPlatform);
    if (plat != noone && plat.collidable) {
        coyoteTime = origCoyoteTime;
        plat.crumbling = true;
    }
}
else {
	coyoteTime--;
}
if jumpKey and coyoteTime > 0 {
	vy = -jumpHeight;
	coyoteTime = 0;
}

// horiz collision
if place_meeting(x+vx,y,oGround) { 
	while !place_meeting(x+sign(vx),y,oGround) { 
		x += sign(vx); 
	} 
	vx = 0; 
} 
if place_meeting(x+vx,y,oBlinkingPlatform) and oBlinkingPlatform.collidable { 
	while !place_meeting(x+sign(vx),y,oBlinkingPlatform) { 
		x += sign(vx); 
	} 
	vx = 0; 
} 
if place_meeting(x+vx,y,oCrumblingPlatform) and oCrumblingPlatform.collidable { 
	while !place_meeting(x+sign(vx),y,oCrumblingPlatform) { 
		x += sign(vx); 
	} 
	vx = 0; 
}
if place_meeting(x+vx,y,oMovingPlatform) { 
	while !place_meeting(x+sign(vx),y,oMovingPlatform) { 
		x += sign(vx); 
	} 
	vx = 0; 
} 
if place_meeting(x+vx,y,oProjectileShooter) { 
	while !place_meeting(x+sign(vx),y,oProjectileShooter) { 
		x += sign(vx); 
	} 
	vx = 0; 
} 

// vert collision
if place_meeting(x,y+vy,oGround) { 
	while !place_meeting(x,y+sign(vy),oGround) { 
		y += sign(vy); 
	} 
	vy = 0; 
} 
if place_meeting(x,y+vy,oBlinkingPlatform) and oBlinkingPlatform.collidable { 
	while !place_meeting(x,y+sign(vy),oBlinkingPlatform) { 
		y += sign(vy); 
	} 
	vy = 0; 
} 
if place_meeting(x, y+vy, oCrumblingPlatform) {
    var plat = instance_place(x, y+vy, oCrumblingPlatform);
    if (plat != noone && plat.collidable) {
        while !place_meeting(x, y+sign(vy), plat) {
            y += sign(vy);
        }
        vy = 0;
        plat.crumbling = true;
    }
}
if place_meeting(x,y+vy,oMovingPlatform) { 
	while !place_meeting(x,y+sign(vy),oMovingPlatform) { 
		y += sign(vy); 
	} 
	vy = 0; 
	vx += oMovingPlatform.vx;
}
if place_meeting(x,y+vy,oProjectileShooter) { 
	while !place_meeting(x,y+sign(vy),oProjectileShooter) { 
		y += sign(vy); 
	} 
	vy = 0; 
} 

// STUPID HENRY FIX FOR GETTING STUCK IN BLOCK
if (
	place_meeting(x,y,oGround) or
	(place_meeting(x,y,oBlinkingPlatform) and oBlinkingPlatform.collidable) or
	place_meeting(x,y,oMovingPlatform) or
	place_meeting(x,y,oProjectileShooter)// or(place_meeting(x,y,oCrumblingPlatform) and instance_place(x,y,oCrumblingPlatform).collidable)
) {
	var hx = 0;
	var vxu = 0;

	// measure horizontal escape
	var d = 0;
	while place_meeting(x-d,y,oGround) or
		(place_meeting(x-d,y,oBlinkingPlatform) and oBlinkingPlatform.collidable) or
		place_meeting(x-d,y,oMovingPlatform) or
		place_meeting(x-d,y,oProjectileShooter) { // or (place_meeting(x-d,y,oCrumblingPlatform) and instance_place(x-d,y,oCrumblingPlatform).collidable) {
		d++;
		if (d > 100) break;
	}
	hx = -d;

	d = 0;
	while place_meeting(x+d,y,oGround) or
		(place_meeting(x+d,y,oBlinkingPlatform) and oBlinkingPlatform.collidable) or
		place_meeting(x+d,y,oMovingPlatform) or
		place_meeting(x+d,y,oProjectileShooter) {// or (place_meeting(x+d,y,oCrumblingPlatform) and instance_place(x+d,y,oCrumblingPlatform).collidable) {
		d++;
		if (d > 100) break;
	}
	if (abs(d) < abs(hx) or hx == 0) hx = d;

	// measure vertical escape
	d = 0;
	while place_meeting(x,y-d,oGround) or
		(place_meeting(x,y-d,oBlinkingPlatform) and oBlinkingPlatform.collidable) or
		place_meeting(x,y-d,oMovingPlatform) or
		place_meeting(x,y-d,oProjectileShooter) { //or (place_meeting(x,y-d,oCrumblingPlatform) and instance_place(x,y-d,oCrumblingPlatform).collidable) 
		d++;
		if (d > 100) break;
	}
	vxu = -d;

	d = 0;
	while place_meeting(x,y+d,oGround) or
		(place_meeting(x,y+d,oBlinkingPlatform) and oBlinkingPlatform.collidable) or
		place_meeting(x,y+d,oMovingPlatform) or
		place_meeting(x,y+d,oProjectileShooter) or
		(place_meeting(x,y+d,oCrumblingPlatform) and instance_place(x,y+d,oCrumblingPlatform).collidable) {
		d++;
		if (d > 100) break;
	}
	if (abs(d) < abs(vxu) or vxu == 0) vxu = d;

	// snap along shortest axis
	if abs(hx) <= abs(vxu) {
		x += hx;
		vx = 0;
	} else {
		y += vxu;
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
if place_meeting(x,y,oSpikes) {
	if room == Room2 {
		x = 352;
		y = 224;
	}
	else if room == Room3 {
		x = 384;
		y = 224;
	}
	else if room == Room4 {
		x = 480;
		y = 160;
	}
}