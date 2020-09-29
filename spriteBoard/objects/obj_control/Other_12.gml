/// @description Banner Movement

//Held Mouse Actions//
if mouse_check_button(mb_left) && !mouse_check_button(mb_right) && !stage {
	
	//Check if mouse hasn't been pressed before...
	if !hold {
		//... then initiate mouse nodes...
		var c = 0;
		repeat (mouseNodes) {
			mousePos[c] = mouseX;
			c++;
			}
		//... set scroll position relative to mouse...
		mouseGrip = scroll-mouseX;
		//... and set mouse as held.
		hold = true;
		}
	
	//Update mouse position.
	var c = mouseNodes-2;
	repeat (mouseNodes-1) {
		mousePos[c+1] = mousePos[c];
		c--;
		}
	mousePos[0] = mouseX;
	//Move banners along.
	scroll = mouseX+mouseGrip;
	
	}

//Released Mouse Actions//
else {
	
	//Check if mouse was being pressed...
	if hold {
		//... if so, get distance between mouse positions...
		var c = 0;
		repeat (mouseNodes-1) {
			mouseSpeed += mousePos[c]-mousePos[c+1];
			c++;
			}
		//... average them to get mouse speed...
		mouseSpeed /= mouseNodes-1;
		//... restrict mouse speed to prevent high speeds...
		mouseSpeed = mouseSpeed*0.75;
		//... and set mouse as released.
		hold = false;
		}
	
	//Start moving once mouse speed stops.
	if abs(mouseSpeed) <= 0 scroll -= scrollSpeed;
	//If not, continue using mouse speed.
	else {
		//Set slow-down rate.
		var spd = 1/5;
		//Reduce speed over time.
		if mouseSpeed > 0 mouseSpeed = max(mouseSpeed-spd,0);
		else mouseSpeed = min(mouseSpeed+spd,0);
		//Adapt speed to mouse momentum.
		scroll += mouseSpeed;
		}
	
	}

//Keep scroll within bounds.
scroll = wrap(scroll-scrollSpeed,-bannerWidth,0);