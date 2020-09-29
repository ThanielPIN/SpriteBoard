/// @description Draw Event

//If startup is active, draw intro.
if startup && stage < 4 {
	event_user(3);
	exit;
	}

//Text format.
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font);

//Theme properties.
var cc = colorFont, aa = ease_out_cubic(alpha,0,1,1);

//Draw background.
draw_clear(colorBack);

//Animate banners.
var c = 0;
repeat (bannerCount) {
	//If sprite has more than one frame, animate it.
	if bannerIndex[c,1] > 1 bannerFrame[c] = wrap(bannerFrame[c]+(bannerIndex[c,2]/60),0,bannerIndex[c,1]);
	c++;
	}

//If banners are found...
if bannerCount {
	//... init X offset...
	var xoffset = 0;
	//... and draw banners.
	var c = 0;
	while (xoffset+scroll<room_width) {
		//Draw banner.
		draw_sprite(bannerIndex[c,0],bannerFrame[c],xoffset+scroll,0);
		//Add sprite width to offset.
		xoffset += sprite_get_width(bannerIndex[c,0]);
		//Next banner.
		c = wrap(c+1,0,bannerCount);
		}
	}
//If not, draw default text.
else draw_text_colour(room_width*0.5,room_height*0.5,stringDef,cc,cc,cc,cc,1);

//If refresh screen is up...
if aa > 0 {
	//... draw refresh background...
	var cc = colorRef;
	draw_rectangle_colour(0,room_height-room_height*aa,room_width,room_height,cc,cc,cc,cc,false);
	//... then refresh text.
	var cc = colorFont;
	draw_text_colour(room_width*0.5,room_height*1.5-room_height*aa,stringRef,cc,cc,cc,cc,aa);
	}

//draw_text_colour(mouseX+16,mouseY,testText,c_black,c_black,c_black,c_black,1);

//Draw intro fade-out.
if startupAlpha > 0 event_user(3);