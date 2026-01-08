#macro sec "sec"
#macro halfsec "halfsec"
#macro quartsec "quartsec"
#macro twelfthsec "twelfthsec"

enum tiles {
	blank,
	topLeftCorner,
	topRightCorner,
	bottomLeftCorner,
	bottomRightCorner,
	leftEdge,
	rightEdge,
	topEdge,
	bottomEdge,
	bottomLeftInnerCorner,
	bottomRightInnerCorner,
	topLeftInnerCorner,
	topRightInnerCorner
}

function is_solid_at(_x, _y)
{
	if (place_meeting(_x, _y, oGround)) return true;
	if (place_meeting(_x, _y, oMovingPlatform)) return true;
	if (place_meeting(_x, _y, oProjectileShooter)) return true;

	if (place_meeting(_x, _y, oBlinkingPlatform) && oBlinkingPlatform.collidable)
		return true;

	var c = instance_place(_x, _y, oCrumblingPlatform);
	if (c != noone && c.collidable)
		return true;

	return false;
}