leftKey = -keyboard_check(ord("A")); 
rightKey = keyboard_check(ord("D")); 
jumpKey = keyboard_check_pressed(vk_space);

vx = spd * (leftKey+rightKey); 
if (vy < terminalVY) { //terminal velocity
	vy += grav; 
}

if place_meeting(x,y+1,oGround) or (place_meeting(x,y+1,oBlinkingPlatform) and oBlinkingPlatform.collidable) { //if on ground
	coyoteTime = origCoyoteTime;
}
else {
	coyoteTime--;
}
if jumpKey and coyoteTime > 0 {
	vy = -jumpHeight;
	coyoteTime = 0;
}

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

x += vx;
y += vy;