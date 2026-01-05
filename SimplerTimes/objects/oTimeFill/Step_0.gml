if type == "sec" timeFrames += 1;
else if type == "halfsec" timeFrames += 2;
else if type == "quartsec" timeFrames += 4;
else if type == "twelfthsec" timeFrames += 12;

if timeFrames == 60 timeFrames = 0;