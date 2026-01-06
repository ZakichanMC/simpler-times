leftKey = -keyboard_check(ord("A")); 
rightKey = keyboard_check(ord("D")); 
jumpKey = keyboard_check_pressed(vk_space);

vx = spd * (leftKey+rightKey); 
if (vy < terminalVY) { //terminal velocity
	vy += grav; 
}

// coyote time
if place_meeting(x,y+1,oGround) or (place_meeting(x,y+1,oBlinkingPlatform) and oBlinkingPlatform.collidable) or place_meeting(x,y+1,oMovingPlatform) { //if on ground
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

x += vx;
y += vy;

// projectile hit detection
sprite_index = sPlayer;
if place_meeting(x,y,oProjectile) sprite_index = sPlayerHit;