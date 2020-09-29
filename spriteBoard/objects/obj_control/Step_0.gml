/// @description Input

//Set window movement offset.
if mouse_check_button_pressed(mb_right) {
	windowGripX = window_get_x()-display_mouse_get_x();
	windowGripY = window_get_y()-display_mouse_get_y();
	}
//Move window.
if mouse_check_button(mb_right) window_set_position(display_mouse_get_x()+windowGripX,display_mouse_get_y()+windowGripY);

//Check if startup is active.
if startup {
	//Animation properties.
	var tt = 45;
	//Rotate loading icon.
	loadingAngle = wrap(loadingAngle-90/15,0,360);
	//Make sure surfaces exists.
	if !surface_exists(logoSurf) logoSurf = surface_create(sprite_get_width(spr_logoText),sprite_get_height(spr_logoText));
	if !surface_exists(loadSurf) loadSurf = surface_create(sprite_get_width(spr_logoText),sprite_get_height(spr_logoText));
	//Check stage.
	switch (stage) {
		//Delay.
		case 0: timer = min(timer+1/30,1);
			break
		//Loading time.
		case 3: timer = min(timer+1/(60*3),1);
			break;
		//Fade out startup screen.
		case 4:
			timer = min(timer+1/tt,1);
			startupAlpha = lerp(1,0,timer);
			break;
		//Logo and text fade-in.
		default:
			//Timer.
			timer = min(timer+1/tt,1);
			//Ease respective UI elements.
			startupTimer[stage-1] = ease_inout_cubic(timer,0,1,1);
			break;
		}
	//If timer is over 1...
	if timer >= 1 {
		//... reset timer and move to next stage.
		timer--;
		stage++;
		//Check if stage is below range...
		if stage > 4 {
			//... and fade out startup if so.
			startup = false;
			stage = 0;
			timer = 0;
			}
		}
	if stage < 4 exit;
	}

//Get mouse position.
mouseX = display_mouse_get_x()-window_get_x();
mouseY = display_mouse_get_y()-window_get_y();

//If banners are found, continue banner movement.
if bannerCount event_user(2);

//Set transition stats.
var spd = 1/16, tmr = 1/(30+refreshDelay*60);
switch (stage) {
	
	//Awaiting Input//
	case 0:
		//Make sure prompt is gone.
		if alpha <= 0 {
			//Refresh init.
			var refresh = false;
		
			//Check for input.
			var bb = keyboard_check_direct(refreshKey);
			//If input doesn't match previous state...
			if bb != input {
				//... refresh if button is pressed...
				if bb refresh = true;
				//... then update previous state.
				input = bb;
				}
		
			//If refresh button has been pressed, trigger refresh.
			if refresh stage = 1;
			}
		//Fade-out prompt.
		else {
			alpha = max(alpha-spd,0);
			}
		break;
	
	//Refreshing//
	case 1:
		//If prompt is covering display...
		if alpha >= 1 {
			//... countdown timer...
			timer = min(timer+tmr,1);
			//... when it reaches 0, refresh display.
			if timer >= 1 {
				event_user(0);
				timer = 0;
				stage = 0;
				mouseSpeed = 0;
				}
			}
		//Fade-in prompt.
		else alpha = min(alpha+spd,1);
		break;
	
	}