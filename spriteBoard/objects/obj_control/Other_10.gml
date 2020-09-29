/// @description Refresh Data

//Banner Update//

//Reset banners.
var c = 0;
repeat (bannerCount) {
	//Flush sprites.
	sprite_delete(bannerIndex[c,0]);
	//Reset animations.
	bannerFrame[c] = 0;
	c++;
	}
//Reset count.
bannerCount = 0;

//Check if any banners are in folder.
var dd = file_find_first(working_directory+"*.png",0);
//If there are...
if dd != "" {
	testText = dd;
	//Create first banner...
	insert_banner(dd);
	//... then search for others.
	while (dd != "") {
		//Search for file.
		var dd = file_find_next();
		//If found, create banner sprite.
		if dd != "" insert_banner(dd);
		}
	}
//Stop checking for files.
file_find_close();

//Theme Update//

//Get file info.
file = file_text_open_read(working_directory+"banner\settings.txt");
//If file exists...
if file != -1 {
	//... loop through every line in the file...
	while (!file_text_eof(file)) {
		//Store current line in a variable...
		dataCheck = file_text_read_string(file);
		file_text_readln(file);
		//... then check for any special data.
		event_user(1);
		}
	//... then close file when finished.
	file_text_close(file);
	}

//Change window size to fit room.
window_set_size(room_width,room_height);
camera_set_view_size(view_camera[0],room_width,room_height);
view_wport[0] = room_width;
view_hport[0] = room_height;
surface_resize(application_surface,room_width,room_height);
display_reset(0,0);

//Update intro size.
var mnW = 384, mxW = 768;
var mnH = 96, mxH = 192;
startupScale = min((max(room_width-mnW,0)/(mxW-mnW)),(max(room_height-mnH,0)/(mxH-mnH)),1)*0.5+0.5;

//Delete previous font.
if font_exists(font) font_delete(font);
//Check for font file in folder.
var ff = file_find_first(working_directory+"*.ttf",0);
//If file is found, turn file into font.
if ff != "" font = font_add(ff,fontSize,fontBold,fontItalic,32,128);
//If not, set Arial as default font.
else font = fnt_arial;
//Close file search.
file_find_close();

//Restart banner position.
scroll = 0;