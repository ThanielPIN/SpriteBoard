/// @description Init

//Main Behaviour//

//Change aliasing.
switch (display_aa) {
	case 2: display_reset(2,false);
		break;
	case 6: display_reset(4,false);
		break;
	case 12: display_reset(8,false);
		break;
	}

//Startup.
startup = true;
startupAlpha = 1;
startupScale = 1;
var c = 0;
repeat (2) {
	startupTimer[c] = 0;
	c++;
	}
loadingAngle = 0;
logoSurf = surface_create(sprite_get_width(spr_logoText),sprite_get_height(spr_logoText));
loadSurf = surface_create(sprite_get_width(spr_loadingIcon),sprite_get_height(spr_loadingIcon));

//Refresh screen.
stage = 0;
alpha = 0;
timer = 0;
input = false;

//File checking.
file = -1;

//Settings//

//Refresh screen.
refreshKey = vk_multiply;
refreshDelay = 0;

//Banner movement.
scroll = 0;
scrollSpeed = 0.25;

//Folders.
folderBanner = "banner";
folderTheme = "theme";

//Text.
stringDef = "No banners found."
stringRef = "Refreshing..."

//Colours.
colorBack = c_gray;
colorRef = c_black;
colorFont = c_white;

//Font.
font = fnt_arial;
fontSize = 18;
fontBold = false;
fontItalic = false;

//Utilities//

//Mouse movement.
mouseX = 0;
mouseY = 0;
mouseNodes = 9;
mouseGrip = 0;
mouseSpeed = 0;
hold = false;

//Window movement.
windowGripX = 0;
windowGripY = 0;

//Banner variables.
bannerCount = 0;
bannerWidth = 0;

testText = "Empty.";

//Refresh//
event_user(0);