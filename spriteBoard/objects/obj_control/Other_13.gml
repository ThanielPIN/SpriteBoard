/// @description Draw Intro

//Logo properties.
var cc = make_colour_rgb(246,190,34), ss = startupScale;
var xx = room_width*0.5, yy = room_height*0.5, ww = sprite_get_width(spr_logoText), hh = sprite_get_height(spr_logoText), ff = ww*0.5-sprite_get_xoffset(spr_logoText);

//Draw background.
draw_set_alpha(startupAlpha);
draw_rectangle_color(0,0,room_width,room_height,cc,cc,cc,cc,false);
draw_set_alpha(1);

//If logo is fading in...
if stage < 3 && surface_exists(logoSurf) {
	//... set up surface...
	surface_set_target(logoSurf);
	draw_clear_alpha(c_white,0);
	//... draw logo text...
	draw_sprite_ext(spr_logoText,0,ww*0.5-(ff)*startupTimer[1],hh*0.5,1,1,0,c_white,1);
	//... subtract rectangle...
	gpu_set_blendmode(bm_subtract);
	draw_rectangle(ff+(ww-ff)*startupTimer[1],0,ww,hh,false);
	gpu_set_blendmode(bm_normal);
	//... and draw surface.
	surface_reset_target();
	draw_surface_ext(logoSurf,xx-ww*ss*0.5,yy-hh*ss*0.5,ss,ss,0,c_white,1);
	}
//If not, draw unprocessed logo.
else draw_sprite_ext(spr_logoText,0,xx-ff*ss,yy,ss,ss,0,c_white,startupAlpha);

//Draw icon.
var aa = -hh+hh*startupTimer[0];
draw_sprite_ext(spr_logoIcon,0,xx+(aa-(ff)*startupTimer[1])*ss,yy+aa*ss,ss,ss,0,c_white,startupAlpha*startupTimer[0]);

//If on waiting phase...
if stage = 3 && surface_exists(loadSurf) {
	//... set icon properties...
	var rr = sprite_get_xoffset(spr_loadingIcon), oo = 24+rr*2;
	//... set up surface...
	surface_set_target(loadSurf);
	draw_clear_alpha(c_white,0);
	//... draw white circle...
	draw_sprite_ext(spr_loadingIcon,0,rr,rr,1,1,0,c_white,1);
	//... subtract section...
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(spr_loadingIcon,1,rr,rr,1,1,loadingAngle,c_white,1);
	gpu_set_blendmode(bm_normal);
	//... and draw surface.
	surface_reset_target();
	draw_surface_ext(loadSurf,room_width-oo*ss,room_height-oo*ss,ss,ss,0,c_white,1);
	}